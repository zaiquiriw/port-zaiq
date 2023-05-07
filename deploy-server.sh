#!/bin/bash
DOCKER_COMPOSE_FILE="docker-compose.prod.yml"

echo "Reached Port Zaiquiri"
echo "Current directory: $(pwd)"
docker load -i images.tar.gz

echo "Create network if it doesn't exist"
docker network ls | grep dock-network || docker network create dock-network

echo 'Create containers with existing images'
echo "Running: docker compose -f $(DOCKER_COMPOSE_FILE) up -d"
docker compose -f $DOCKER_COMPOSE_FILE up --detach