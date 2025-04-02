#!/bin/bash
until ! lsof -i :3000; do
  docker kill  $(docker ps -q --filter "expose=3000")

  echo "Waiting for port 3000 to be free..."
  sleep 1
done

# Build journal-app docker image
docker build -t journal-app:latest .

# Run journal-app docker image
CONTAINER_ID=$(docker run -e RAILS_ENV=development -p 3000:3000 -dit journal-app:latest)

echo "New container started with ID: $CONTAINER_ID"
