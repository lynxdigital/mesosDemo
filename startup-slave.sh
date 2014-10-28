#!/bin/bash
export PATH=$PATH:/usr/local/sbin:/usr/local/bin
MESOS_WORKDIR="/var/lib/mesos"
MESOS_LOGDIR="/var/log/mesos"
MASTERIP="192.168.58.201"
MESOS_ZKLIST=zk://$MASTERIP:2181/mesos

echo "docker,mesos" > /etc/mesos-slave/containerizers
echo '5mins' > /etc/mesos-slave/executor_registration_timeout
echo $MESOS_ZKLIST > /etc/mesos/zk

# Start Mesos Slave
/usr/local/bin/mesos slave --ip=192.168.58.211 --master=$MESOS_ZKLIST --containerizers=docker,mesos --executor_registration_timeout=5mins --work_dir=$MESOS_WORKDIR --log_dir=$MESOS_LOGDIR

