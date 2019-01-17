#!/bin/bash

# project dir
PROJECT_DIR=`cd \`dirname $0\`;cd ..;pwd`
DOCKER_DIR=${PROJECT_DIR}/docker

# Build rocketmq
docker build -t rocketmqinc/rocketmq:4.3.0 --build-arg version=4.3.0 ${DOCKER_DIR}

# Stop and remove existed containers if any
docker rm -f $(docker ps -a|awk '/rocketmqinc\/rocketmq/ {print $1}')

# Run namesrv and broker
docker run -d -p 9876:9876 -v ${DOCKER_DIR}/data/namesrv/logs:/root/logs -v ${DOCKER_DIR}/data/namesrv/store:/root/store --name rmqnamesrv  rocketmqinc/rocketmq:4.3.0 sh mqnamesrv
docker run -d -p 10911:10911 -p 10909:10909 -v ${DOCKER_DIR}/data/broker/logs:/root/logs -v ${DOCKER_DIR}/data/broker/store:/root/store --name rmqbroker --link rmqnamesrv:namesrv -e "NAMESRV_ADDR=namesrv:9876" rocketmqinc/rocketmq:4.3.0 sh mqbroker