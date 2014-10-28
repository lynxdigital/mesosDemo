#!/bin/bash
docker run -d --name registry -p 5000:5000/tcp -v /tmp/docker-registry:/var/lib/docker-registry registry:latest
