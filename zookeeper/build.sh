#!/bin/bash
# Build Zookeeper Container
# Geoffrey Harrison

# Check For Existing Zookeeper Image And Remove
docker images zookeeper | grep -q latest
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current Zookeeper Image..."
  docker rmi zookeeper:latest > /dev/null
  echo "DONE!"
fi

# Create New Zookeeper Image In Docker
echo
echo " Creating New Zookeeper Image..."
echo
docker build -t zookeeper:latest .
echo
echo " Image Creation Completed!"
echo
