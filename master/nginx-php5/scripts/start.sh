#!/bin/bash

php-fpm -D

exec nginx -c /etc/nginx/nginx.conf

