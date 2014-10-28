#!/bin/bash
MESOS_WORKDIR="/var/lib/mesos"
MESOS_LOGDIR="/var/log/mesos"
MASTERIP="192.168.58.201"
MESOS_ZKLIST=zk://$MASTERIP:2181/mesos

echo "docker,mesos" > /etc/mesos-slave/containerizers
echo '5mins' > /etc/mesos-slave/executor_registration_timeout

# Start Mesos Slave
mesos slave --master=$MESOS_ZKLIST --containerizers=docker,mesos --executor_registration_timeout=5mins --work_dir=$MESOS_WORKDIR --log_dir=$MESOS_LOGDIR

