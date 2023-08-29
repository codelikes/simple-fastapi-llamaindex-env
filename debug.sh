#!/bin/bash

source .env

# enter the container
docker exec -it ${DOCKER_CONTAINER_NAME} /bin/sh
