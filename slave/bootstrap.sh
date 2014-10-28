#!/usr/bin/env bash

# Update Image And Install Packages
yum -y update
rpm -Uvh http://repos.mesosphere.io/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm
yum -y install epel-release
yum -y install wget curl docker-io bind-utils mesos tar
yum -y clean all

# Update IP Forwarding
sed -i "s/^net.ipv4.ip_forward.*/net.ipv4.ip_forward = 1/g" /etc/sysctl.conf
sysctl -p

# Modify Docker Startup And Start Docker Service
chkconfig docker on
service docker start

# Add Vagrant User To Docker Group
usermod -a -G docker vagrant

# Copy In Files From Vagrant Share
mkdir -p /opt/mesosDemo
chown vagrant:vagrant -R /opt/mesosDemo
cp -av /vagrant/slave/* /opt/mesosDemo/
chmod u+x /opt/mesosDemo/startup.sh

# Disable Mesos Auto Startup
rm -f /etc/init/mesos-master.conf
rm -f /etc/init/mesos-slave.conf

# Add Mesos Startup To Boot
echo >> /etc/rc.local
echo "# Mesos Slave Startup" >> /etc/rc.local
echo "/opt/mesosDemo/startup.sh &" >> /etc/rc.local

# Reboot Machine
reboot

