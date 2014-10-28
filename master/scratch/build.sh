#!/usr/bin/env bash
# Create Empty Docker Image To Base All Other Images Off Of
# Geoffrey Harrison

# Check For Existing Scratch And Remove If It Does
docker images scratch | grep -q latest
if [ $? -eq 0 ]
then
  echo
  echo -n " Removing Current Scratch Image..."
  docker rmi scratch:latest > /dev/null
  echo "DONE!"
fi

# Create New Scratch Image In Docker
echo
echo -n " Creating New Scratch Image..."
tar cv --files-from /dev/null | docker import - scratch:latest > /dev/null
echo "DONE!"
echo
