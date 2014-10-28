#!/bin/bash
# Build Application Container
# Geoffrey Harrison

# Check For Existing MyApp Image And Remove
docker images myapp | grep -q latest
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current MyApp Image..."
  docker rmi myapp:latest > /dev/null
  echo "DONE!"
fi

# Create New Nginx MyApp Image In Docker
echo
echo " Creating New MyApp Image..."
echo
docker build -t myapp:latest .
echo
echo " Image Creation Completed!"
echo
