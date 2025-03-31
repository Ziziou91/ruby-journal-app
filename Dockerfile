FROM ruby:3.1.2

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies for development
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    file \
    git \
    procps \
    sudo \
    wget \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install base packages
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    postgresql \
    postgresql-contrib \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


# Create directory for application
RUN mkdir /home/app
ADD ./journal-app /home/app/journal-app
WORKDIR /home/app/journal-app

# Install Ruby gems for development
RUN gem install bundler && bundle install --jobs=3 --retry=3 

# Entrypoint prepares the database.
ENTRYPOINT ["./bin/docker-entrypoint"]

# Launch the server
CMD ["rails", "server", "-b", "0.0.0.0"]
