#!/bin/bash
# Build Docker Registry On The CentOS 6 Image
# Geoffrey Harrison

# Check For Existing Docker Registry Image And Remove
docker images registry | grep -q latest
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current Docker Registry Image..."
  docker rmi registry:latest > /dev/null
  echo "DONE!"
fi

# Create New Docker Registry Image In Docker
echo
echo " Creating New Docker Registry Base Image..."
echo
docker build -t registry:latest .
echo
echo " Image Creation Completed!"
echo
