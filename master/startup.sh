#!/usr/bin/env bash

# Start Docker Machines For Master Services
cd /opt/mesosDemo
for CONTAINER in zookeeper mesos-master registry haproxy
do
  # Check For Old Container - Remove If Found
  docker ps -a | grep -q $CONTAINER > /dev/null
  if [ $? -eq 0 ]
  then
    ID=$(docker ps -a | grep $CONTAINER | awk '{print $1}')
    docker stop $ID
    docker rm $ID
  fi

  # Startup New Container
  cd $CONTAINER/
  ./run.sh
  cd ..
done
