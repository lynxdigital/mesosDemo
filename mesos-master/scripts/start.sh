#!/bin/bash

# Check For Passed In Variables
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

# Check If ZooKeeper Servers Are Linked - If Not Mesos Will Default To Local ZooKeeper Install
set | grep -q ZK > /dev/null
if [ $? -eq 0 ]
then
  # Gather ZooKeeper Strings And Put In Mesos File
  ZKLIST=`set | grep ZK | grep tcp:// | grep -v 888 | grep _TCP | sed 's/^.*=tcp:\/\///g' | tr "\n" "," | sed 's/^/zk:\/\//g'`
  MESOS_ZKLIST=`echo $ZKLIST | sed 's/,$/\/mesos\n/g'`
  MARATHON_ZKLIST=`echo $ZKLIST | sed 's/,$/\/marathon\n/g'`
  echo $MESOS_ZKLIST > /etc/mesos/zk
fi

# Set Mesos Quorum
echo $MESOS_QUORUM > /etc/mesos-master/quorum
echo $MESOS_WORKDIR > /etc/mesos-master/work_dir

if [ -e "$MESOS_HOSTNAME" ]
then
  echo $MESOS_HOSTNAME > /etc/mesos-master/hostname
fi

# Start Mesos Master
mesos master --zk=$MESOS_ZKLIST --work_dir=$MESOS_WORKDIR --quorum=$MESOS_QUORUM --log_dir=$MESOS_LOGDIR --quiet &

# Start Marathon Framework
cd /usr/local/marathon
./bin/start --master $MESOS_ZKLIST --zk $MARATHON_ZKLIST --ha

