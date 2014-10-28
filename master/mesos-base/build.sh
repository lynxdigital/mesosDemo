#!/bin/bash
# Build Mesos Base Container
# Geoffrey Harrison

# Check For Existing Mesos Image And Remove
docker images mesos | grep -q base
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current Mesos Base Image..."
  docker rmi mesos:base > /dev/null
  echo "DONE!"
fi

# Create New Mesos Base Image In Docker
echo
echo " Creating New Mesos Base Image..."
echo
docker build -t mesos:base .
echo
echo " Image Creation Completed!"
echo
