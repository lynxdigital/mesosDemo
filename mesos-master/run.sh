#!/bin/bash
docker run -d --name mesos-master --net="host" mesos:master
