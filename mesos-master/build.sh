#!/bin/bash
# Build Mesos Master Container With Marathon
# Geoffrey Harrison

# Check For Existing Mesos Image And Remove
docker images mesos | grep -q master
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current Mesos Master Image..."
  docker rmi mesos:master > /dev/null
  echo "DONE!"
fi

# Create New Mesos Master Image In Docker
echo
echo " Creating New Mesos Master Image..."
echo
docker build -t mesos:master .
echo
echo " Image Creation Completed!"
echo
