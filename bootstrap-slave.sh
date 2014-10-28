#!/usr/bin/env bash

# Update Image And Install Packages
yum -y update
rpm -Uvh http://repos.mesosphere.io/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm
yum -y install epel-release
yum -y install wget curl docker-io bind-utils mesos tar
yum -y clean all

# Modify Docker Startup And Start Docker Service
chkconfig docker on
service docker start

# Add Vagrant User To Docker Group
usermod -a -G docker vagrant

# Add Master Startup To Boot
echo /opt/mesosDemo/startup-slave.sh >> /etc/rc.local

# Copy In Files
mkdir -p /opt/mesosDemo
cp -av /vagrant/startup-slave.sh /opt/mesosDemo/
chmod u+x /opt/mesosDemo/startup-slave.sh

# Reboot
reboot

