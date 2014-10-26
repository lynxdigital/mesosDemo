#!/bin/bash

docker run -d --name zookeeper -p 127.0.0.1:2181:2181/tcp -e ZK_ID=1 zookeeper:latest

docker run -d --name mesos-master -p 5050:5050/tcp -p 8080:8080/tcp --link zookeeper:zk mesos:master

docker run -d --name registry -p 127.0.0.1:5000:5000/tcp -v /tmp/docker-registry:/var/lib/docker-registry registry:latest


