#!/bin/bash
docker run -d --name mesos-master -p 5050:5050/tcp -p 8080:8080/tcp --link zookeeper:zk mesos:master
