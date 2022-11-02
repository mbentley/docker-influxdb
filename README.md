# mbentley/influxdb

Docker image that extends the default `influxdb` images

## Tags

* `2.5-alpine` - maps to `influxdb:2.5-alpine`
* `2.4-alpine` - maps to `influxdb:2.4-alpine`
* `2.3-alpine` - maps to `influxdb:2.3-alpine`
* `2.2-alpine` - maps to `influxdb:2.2-alpine`
* `2.1-alpine` - maps to `influxdb:2.1-alpine`
* `2.0-alpine` - maps to `influxdb:2.0-alpine`

## Differences

* Adds ability to change the UID/GID of the user at build time (defaults to `512:512`)
* Custom pre-entrypoint to set UID/GID filesystem permissions recursively at start time to override previous permissions from parent image
