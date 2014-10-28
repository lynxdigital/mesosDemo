#!/usr/bin/env bash

# Update Image And Install Packages
yum -y update
yum -y install epel-release
yum -y install wget curl docker-io bind-utils

# Modify Docker Startup And Start Docker Service
chkconfig docker on
service docker start

# Build Docker Machines For Master Service
cd /vagrant
for G in scratch centos6 java8 mesos-base nginx-php5 mesos-master zookeeper registry myapp
do
  cd $G/
  ./build.sh
  cd ..
done

# Add Vagrant User To Docker Group
usermod -a -G docker vagrant

# Add Master Startup To Boot
echo /opt/mesosDemo/startup-master.sh >> /etc/rc.local

# Copy In Files
mkdir -p /opt/mesosDemo
cp -av /vagrant/* /opt/mesosDemo/

# Update IP Forwarding
sed -i "s/^net.ipv4.ip_forward.*/net.ipv4.ip_forward = 1/g" /etc/sysctl.conf
sysctl -p

# Reboot
reboot

