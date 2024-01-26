# Use a suitable Elixir base image
FROM elixir:latest

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install build dependencies
RUN apt-get update && apt-get install -y build-essential git

# Install Hex and Rebar
RUN mix local.hex --force && mix local.rebar --force

# Set build environment
ENV MIX_ENV=dev

# Install mix dependencies
RUN mix deps.get --only $MIX_ENV

# Compile assets with hot reloading
RUN mix assets.setup

# Compile the project
RUN mix deps.compile

# Start Phoenix server
CMD ["mix", "phx.server"]
