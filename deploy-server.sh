#!/bin/bash

echo 'Reached Port Zaiquiri'
cd $REMOTE_DIR

echo 'Current directory: $(pwd)'
docker load -i images.tar.gz

echo "Create network if it doesn't exist"
docker network ls | grep dock-network || docker network create dock-network

echo 'Create containers with existing images'
docker-compose -f $DOCKER_COMPOSE_FILE up -d"