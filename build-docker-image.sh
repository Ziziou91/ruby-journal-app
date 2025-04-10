#!/bin/bash

IMAGE_NAME="rails-app"

# Check if the container is running
if ! docker ps --format '{{.Names}}' | grep -q "$IMAGE_NAME"; then
  echo "🚫 Container '$IMAGE_NAME' is not running."

  # Check if the image exists
  if ! docker images --format '{{.Repository}}' | grep -q "$IMAGE_NAME";
  then
    echo "🔧 Docker image '$IMAGE_NAME' not found. Building it now..."
    docker-compose build

  fi
  docker-compose up

else
  # Update precompiled assets
  echo "✅ Container '$IMAGE_NAME' is running. Updating the precompiled assets 🛠️"
  docker-compose exec rails-app bin/rails assets:precompile

  # Restart the application to apply changes
  echo "🔄 Restarting the app..."
  docker-compose restart rails-app
fi
