# Use an official lightweight base image
FROM debian:stable-slim

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Ghostscript
RUN apt-get update && \
    apt-get install -y ghostscript && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy the entrypoint script (which includes the Ghostscript compression command)
COPY ./src/compress.sh compress.sh

# Make the script executable
RUN chmod +x compress.sh

ENTRYPOINT ["sh","/usr/src/app/compress.sh"]