#!/bin/bash

#Check For Passed In Variables
if [ -z "$MESOS_QUORUM" ]
then
  MESOS_QUORUM="1"
fi
if [ -z "$MESOS_WORKDIR" ]
then
  MESOS_WORKDIR="/var/lib/mesos"
fi
if [ -z "$MESOS_LOGDIR" ]
then
  MESOS_LOGDIR="/var/log/mesos"
fi

MASTERIP=$(ip addr show eth1 | grep "inet " | awk '{print $2}' | sed 's/\/.*$//g')
MESOS_ZKLIST=zk://$MASTERIP:2181/mesos
MARATHON_ZKLIST=zk://$MASTERIP:2181/marathon
echo $MASTERIP > /etc/mesos-master/ip
echo $MESOS_ZKLIST > /etc/mesos/zk

# Set Mesos Quorum
echo $MESOS_QUORUM > /etc/mesos-master/quorum
echo $MESOS_WORKDIR > /etc/mesos-master/work_dir

if [ -e "$MESOS_HOSTNAME" ]
then
  echo $MESOS_HOSTNAME > /etc/mesos-master/hostname
fi

# Start Mesos Master
mesos master --ip=$MASTERIP --zk=$MESOS_ZKLIST --work_dir=$MESOS_WORKDIR --quorum=$MESOS_QUORUM --log_dir=$MESOS_LOGDIR --quiet &

# Start Marathon Framework
cd /usr/local/marathon
./bin/start --master $MESOS_ZKLIST --zk $MARATHON_ZKLIST --ha

