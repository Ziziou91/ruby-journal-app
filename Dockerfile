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
    && rm -rf /var/lib/apt/lists/*


# Install dependencies including postgresql
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    postgresql \
    postgresql-contrib \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Ruby gems for development
RUN gem install \
    bundler \
    rails \
    rspec \
    rubocop \
    pry \
    solargraph

# Create directory for application
RUN mkdir /home/app
WORKDIR /home/app
COPY ruby_script.rb /home/app/ruby_script.rb

# Default command
CMD ["ruby", "ruby_script.rb"]