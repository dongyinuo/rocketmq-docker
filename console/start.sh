#!/bin/bash

# console dir
CONSOLE_DIR=`cd \`dirname $0\`;pwd`

# Stop and remove existed containers if any
docker rm -f $(docker ps -a|awk '/console/ {print $1}')

# Run namesrv and broker
docker-compose -f ${CONSOLE_DIR}/docker/docker-compose.yml up -d