#!/bin/bash

set -eo pipefail

echo "INFO: Running pre-entrypoint to set the filesystem permissions on '/etc/influxdb2' and '/var/lib/influxdb2'"
# set permissions
chown -R influxdb:influxdb /etc/influxdb2 /var/lib/influxdb2

# run the actual command (defaults to the /entrypoint.sh plus the CMD, if passed)
echo "INFO: Pre-entrypoint complete; executing '${*}'"
exec "${@}"
