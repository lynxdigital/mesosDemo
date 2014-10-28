#!/usr/bin/env bash

docker run -d --name zookeeper -p 2181:2181/tcp -e ZK_ID=1 zookeeper:latest

# Time Needed For ZooKeeper To Start
sleep 10
