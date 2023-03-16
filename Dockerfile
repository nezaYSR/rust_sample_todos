# Use a Rust base image
FROM rust:latest AS build

# Set the working directory
WORKDIR /app

# Copy the source code
COPY ./src ./src
COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock

# Build the application
RUN cargo build --release

# Create the actual container image
FROM debian:buster-slim

# Install OpenSSL
RUN apt-get update && apt-get install -y openssl

# Set the working directory
WORKDIR /app

# Copy the binary from the build container
COPY --from=build /app/target/release/todo-actix .

# Expose the HTTP port
EXPOSE 8080

# Set the startup command
CMD ["./todo-actix"]
