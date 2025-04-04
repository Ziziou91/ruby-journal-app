#!/bin/bash
until ! lsof -i :3000; do
  docker kill  $(docker ps -q --filter "expose=3000")
  sleep 1
done

# Build journal-app docker image
docker build -t zizou91/journal-app:latest .

# Run journal-app docker image
docker run -e RAILS_ENV=development -p 3000:3000 -dit zizou91/journal-app:latest
