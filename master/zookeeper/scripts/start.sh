#!/usr/bin/env bash

# Check For Required Variables
if [ -z "$ZK_ID" ]
then
  echo
  echo ERROR: ZK_ID Is A Required Environment Variable.
  echo
  exit 1
fi
if [ -z "$ZK_SERVERS" ]
then
  ZK_SERVERS="127.0.0.1"
fi
if [ -z "$ZK_CLIENTPORT" ]
then
  ZK_CLIENTPORT="2181"
fi

# Configure And Run ZooKeeper
zookeeper-server-initialize --myid=$ZK_ID

sed -i "s/^clientPort=.*/clientPort=$ZK_CLIENTPORT/g" /etc/zookeeper/conf/zoo.cfg

echo >> /etc/zookeeper/conf/zoo.cfg
COUNT=0
for SERVER in $ZK_SERVERS
do
  COUNT=$((COUNT+1))
  echo server.$COUNT=$SERVER:2888:3888 >> /etc/zookeeper/conf/zoo.cfg
done

zookeeper-server start
tail -f /var/log/zookeeper/*

