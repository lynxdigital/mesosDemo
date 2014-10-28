#!/usr/bin/env bash
service docker-registry start
exec tail -f /var/log/*

