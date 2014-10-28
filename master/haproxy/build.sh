#!/usr/bin/env bash
# Build HAProxy Container From CentOS 6
# Geoffrey Harrison

# Check For Existing HAProxy Image And Remove
docker images haproxy | grep -q latest
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current HAProxy Image..."
  docker rmi haproxy:latest > /dev/null
  echo "DONE!"
fi

# Create New HAProxy In Docker
echo
echo " Creating New HAProxy Image..."
echo
docker build -t haproxy:latest .
echo
echo " Image Creation Completed!"
echo
