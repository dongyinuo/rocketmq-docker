#!/bin/bash

PROJECT_DIR=`cd \`dirname $0\`;cd ..;pwd`
NETWORK_NAME="rocketmq"

# create network if need
if [[ -z `docker network ls | grep ${NETWORK_NAME}` ]];then
    docker network create ${NETWORK_NAME}
fi

# Stop and remove existed containers if any
docker rm -f $(docker ps -a|awk '/rocketmqinc\/rocketmq/ {print $1}')

# Run namesrv and broker
docker-compose -f ${PROJECT_DIR}/docker-compose/docker-compose.yml up -d