#!/bin/bash

# Start Docker Machines For Master Services
cd /opt/mesosDemo
for G in zookeeper mesos-master registry haproxy
do
  cd $G/
  ./run.sh
  cd ..
done
