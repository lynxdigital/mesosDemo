#!/bin/bash

# Start Docker Machines For Master Services
cd /opt/mesosDemo
for G in zookeeper mesos-master registry haproxy
do
  docker ps -a | grep -q $G > /dev/null
  if [ $? -eq 0 ]
  then
    ID=$(docker ps -a | grep $G | awk '{print $1}')
    docker stop $ID
    docker rm $ID
  fi
  cd $G/
  ./run.sh
  cd ..
done
