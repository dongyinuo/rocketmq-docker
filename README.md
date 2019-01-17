# RocketMQ Docker

## Start Server

- ### Start Broker & Namesrv
    ``
    sh rockermq/start.sh
    ``

- ### Start Console
    ``
    sh console/start.sh
    ``
- ### Check Service Detail
    ``
    docker ps
    ``
- ### See Log
    ``
    docker logs -f --tail 100 console
    ``
    
    ``
    docker logs -f --tail 100 rmqbroker
    ``
    
    ``
    docker logs -f --tail 100 rmqnamesrv
    ``    


## Graduated Projects

### [RocketMQ Client CPP](https://github.com/apache/rocketmq-client-cpp)

### [RocketMQ Client Python](https://github.com/apache/rocketmq-client-python)

### [RocketMQ Spring](https://github.com/apache/rocketmq-spring)

### [RocketMQ Client Go](https://github.com/apache/rocketmq-client-go)

