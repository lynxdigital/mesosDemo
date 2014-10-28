#!/usr/bin/env bash
# Build CentOS 6 Image From Scratch
# Geoffrey Harrison

# Check For Existing Centos 6 Image And Remove
docker images centos6 | grep -q base
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current CentOS 6 Base Image..."
  docker rmi centos6:base > /dev/null
  echo "DONE!"
fi

# Create New CentOS 6 Base Image In Docker
echo
echo " Creating New CentOS 6 Base Image..."
echo
docker build -t centos6:base .
echo
echo " Image Creation Completed!"
echo

