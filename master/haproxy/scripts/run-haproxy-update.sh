#!/usr/bin/env bash
/usr/bin/haproxy-marathon-bridge.sh 192.168.58.201:8080 > /etc/haproxy/haproxy.cfg
service haproxy reload

