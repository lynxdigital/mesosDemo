#!/usr/bin/env bash
# Build Nginx PHP5 Container
# Geoffrey Harrison

# Check For Existing Nginx PHP5 Image And Remove
docker images nginx | grep -q php5
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current Nginx PHP Image..."
  docker rmi nginx:php5 > /dev/null
  echo "DONE!"
fi

# Create New Nginx PHP5 Base Image In Docker
echo
echo " Creating New Nginx PHP Image..."
echo
docker build -t nginx:php5 .
echo
echo " Image Creation Completed!"
echo
