#!/bin/sh

echo "Starting the server"
pip install --no-cache-dir -r requirements.txt

uvicorn src.main:app --port ${DOCKER_CONTAINER_PORT} --host 0.0.0.0
