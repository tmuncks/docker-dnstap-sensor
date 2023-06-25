#!/bin/sh

set -euo pipefail

# Setup defaults (based on /etc/defaults/dnstap-sensor)

# APIKEI is required, no defaults
DNSTAP_SENSOR_APIKEY=${DNSTAP_SENSOR_APIKEY:=""}

# Socket path is required, image default is: /dnstap/dnstap.socket
DNSTAP_SENSOR_INPUT=${DNSTAP_SENSOR_INPUT:="/dnstap/dnstap.socket"}

# Channel, args and servers use the application defaults
DNSTAP_SENSOR_CHANNEL=${DNSTAP_SENSOR_CHANNEL:="203"}
DNSTAP_SENSOR_ARGS=${DNSTAP_SENSOR_ARGS:="-heartbeat=60s -retry=15s -flush=500ms"}
DNSTAP_SENSOR_SERVERS=${DNSTAP_SENSOR_SERVERS:="wss://submit.sie-network.net/"}

umask 0
exec /app/dnstap-sensor -apikey "${DNSTAP_SENSOR_APIKEY}" -channel "${DNSTAP_SENSOR_CHANNEL}" -input "${DNSTAP_SENSOR_INPUT}" ${DNSTAP_SENSOR_ARGS} ${DNSTAP_SENSOR_SERVERS}
