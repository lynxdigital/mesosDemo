#!/usr/bin/env bash
# Build Java 8 Container
# Geoffrey Harrison

# Check For Existing Java 8 Image And Remove
docker images centos6 | grep -q java8
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current CentOS 6 - Java 8 Image..."
  docker rmi centos6:java8 > /dev/null
  echo "DONE!"
fi

# Create New Java 8 Image In Docker
echo
echo " Creating New CentOS 6 - Java 8 Image..."
echo
docker build -t centos6:java8 .
echo
echo " Image Creation Completed!"
echo
