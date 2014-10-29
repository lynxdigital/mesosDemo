#!/usr/bin/env bash

# Execute MyApp In Marathon
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d@start_myapp.json localhost:8080/v2/apps


