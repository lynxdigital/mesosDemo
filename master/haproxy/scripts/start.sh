#!/bin/bash
while true
do
	echo Running Reload - `date`
	/usr/bin/run-haproxy-update.sh > /dev/null
	sleep 60
done
