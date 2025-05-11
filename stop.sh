#!/bin/bash

if [ -f .env ]; then
  source .env
fi

if [ ! -z "$DOCKER_REGISTRY_URL" ]; then
	echo $DOCKER_REGISTRY_PASSWORD | docker login -u $DOCKER_REGISTRY_ID $DOCKER_REGISTRY_URL --password-stdin
fi

docker compose down