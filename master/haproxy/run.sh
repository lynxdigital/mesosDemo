#!/usr/bin/env bash
docker run -d --name haproxy -p 80:10000/tcp haproxy:latest
