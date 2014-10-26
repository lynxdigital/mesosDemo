#!/bin/bash

# Check For Passed In Variables
if [ -z "$MESOS_WORKDIR" ]
then
  MESOS_WORKDIR="/var/lib/mesos"
fi
if [ -z "$MESOS_LOGDIR" ]
then
  MESOS_LOGDIR="/var/log/mesos"
fi

# Check If ZooKeeper Servers Are Linked For Master Access
set | grep -q ZK > /dev/null
if [ $? -eq 0 ]
then
  # Gather ZooKeeper Strings And Put In Mesos File
  ZKLIST=`set | grep ZK | grep tcp:// | grep -v 888 | grep _TCP | sed 's/^.*=tcp:\/\///g' | tr "\n" "," | sed 's/^/zk:\/\//g'`
  MESOS_ZKLIST=`echo $ZKLIST | sed 's/,$/\/mesos\n/g'`
else
    echo
    echo " Zookeeper Instance Needs To Be Linked To Find Master."
	echo
	exit 1
fi

# Start Mesos Slave
mesos slave --master=$MESOS_ZKLIST --work_dir=$MESOS_WORKDIR --log_dir=$MESOS_LOGDIR

