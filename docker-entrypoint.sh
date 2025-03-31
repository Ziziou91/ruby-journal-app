#!/bin/bash
set -e

# Initialize rbenv if it exists
if [ -d "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi

# Execute the command passed to docker run
exec "$@"