#!/bin/bash
# Build Mesos Slave Container
# Geoffrey Harrison

# Check For Existing Mesos Image And Remove
docker images mesos | grep -q slave
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current Mesos Slave Image..."
  docker rmi mesos:slave > /dev/null
  echo "DONE!"
fi

# Create New Mesos Slave Image In Docker
echo
echo " Creating New Mesos Slave Image..."
echo
docker build -t mesos:slave .
echo
echo " Image Creation Completed!"
echo
