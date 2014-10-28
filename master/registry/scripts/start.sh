#!/bin/bash

service docker-registry start
exec tail -f /var/log/*

