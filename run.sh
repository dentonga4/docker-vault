#!/bin/bash

# Conditions
create_network=0
create_certs=0

# Stop any running containers
docker-compose down

# Build Docker image
docker build . -t vault 

# Run docker containers
docker-compose up