# start from upstream buildkit image & upgrade all packages
ARG INFLUXDB_TAG="2.1-alpine"
FROM influxdb:${INFLUXDB_TAG} AS upstream

RUN apk --no-cache upgrade --purge

# copy over the contents into a new image and add my customizations
FROM scratch COPY --from=upstream / /
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

# build args for the new UID & GID
ARG INFLUX_UID="512"
ARG INFLUX_GID="512"

# remove the existing influxdb user and group (deluser also removes the group)
RUN deluser influxdb

# add the group & user with the new UID & GID passed
RUN addgroup -S -g "${INFLUX_GID}" influxdb &&\
  adduser -S -G influxdb -u "${INFLUX_UID}" -h /home/influxdb -s /bin/sh influxdb &&\
  mkdir -p /home/influxdb &&\
  chown -R influxdb:influxdb /home/influxdb

COPY entrypoint-permissions.sh /
ENTRYPOINT ["/entrypoint-permissions.sh","/entrypoint.sh"]
