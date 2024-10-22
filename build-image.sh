#!/bin/bash

# Build the Docker image using Docker Compose
echo "Building Docker image using Docker Compose..."
docker-compose build --no-cache

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image built successfully!"
else
  echo "Failed to build Docker image."
  exit 1
fi