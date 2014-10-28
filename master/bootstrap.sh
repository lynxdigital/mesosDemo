#!/usr/bin/env bash

# Update Image And Install Packages
yum -y update
yum -y install epel-release
yum -y install wget curl docker-io bind-utils

# Update IP Forwarding
sed -i "s/^net.ipv4.ip_forward.*/net.ipv4.ip_forward = 1/g" /etc/sysctl.conf
sysctl -p

# Modify Docker Startup And Start Docker Service
chkconfig docker on
service docker start

# Add Vagrant User To Docker Group
usermod -a -G docker vagrant

# Copy In Files
mkdir -p /opt/mesosDemo
chown vagrant:vagrant -R /opt/mesosDemo
cp -av /vagrant/master/* /opt/mesosDemo/
chmod u+x /opt/mesosDemo/startup.sh

# Build Docker Machines For Master Service
cd /opt/mesosDemo
for G in scratch centos6 java8 mesos-base nginx-php5 mesos-master zookeeper haproxy registry myapp
do
  cd $G/
  ./build.sh
  cd ..
done

# Start Registry And Push MyApp
cd registry/
REGISTRY=$(./run.sh)
sleep 10
cd ..
MYAPPID=$(docker images myapp | awk '{print $3}' | grep -v IMAGE)
docker tag $MYAPPID 192.168.58.201:5000/myapp:latest
docker push 192.168.58.201:5000/myapp:latest
docker stop $REGISTRY
docker rm $REGISTRY
docker rm 192.168.58.201:5000/myapp:latest

# Add Master Startup To Boot
echo >> /etc/rc.local
echo "# Mesos Master Startup" >> /etc/rc.local
echo "/opt/mesosDemo/startup.sh" >> /etc/rc.local

# Reboot
reboot

