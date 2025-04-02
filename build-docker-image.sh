#!/bin/bash

# Build journal-app docker image
docker build -t journal-app:latest .

# Run journal-app docker image
CONTAINER_ID=$(docker run -e RAILS_ENV=development -p 3000:3000 -dit journal-app:latest)
