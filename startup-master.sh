#!/bin/bash

# Start Docker Machines For Master Services
cd /opt/mesosDemo
for G in zookeeper mesos-master registry
do
  cd $G/
  ./run.sh
  cd ..
done
