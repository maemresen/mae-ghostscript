# mae-ghostscript

## Overview
`mae-ghostscript` is a Docker-based tool designed for compressing PDF files using Ghostscript. This repository includes a Docker image that streamlines the PDF compression process in a consistent, containerized environment.

## Features
- Simple PDF compression using Ghostscript.
- Runs within a Docker container, ensuring a consistent and isolated environment.
- Easy to use with straightforward input commands.

## Prerequisites
- [Docker](https://www.docker.com/get-started) installed on your machine.
- Access to the Docker Hub repository [maemresen/mae-ghostscript](https://hub.docker.com/repository/docker/maemresen/mae-ghostscript/general).

## Usage

### Running the Docker Container
To compress a PDF file, follow these steps:

1. Place your PDF files in a local directory named `pdf-files` (or create one in your current directory).
2. Run the provided script or use the Docker command directly.

### Using the Script

Create a script named `compress-pdf.sh` with the following content:

```bash
#!/bin/bash

# Check if both input and output PDF file paths are provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input.pdf"
  exit 1
fi

# Assign the input argument to a variable
INPUT_PDF=$1

# Run the Docker container to compress the PDF
echo "Running temporary container via Docker to compress the PDF..."

docker run --rm -it --name mae-ghostscript \
  -v "$(pwd)/pdf-files:/app/pdf-files" \
  -e "INPUT_PDF=$INPUT_PDF" \
  maemresen/mae-ghostscript

# Check if the compression was successful
if [ $? -eq 0 ]; then
  echo "PDF compression completed successfully!"
else
  echo "Failed to compress the PDF."
  exit 1
fi
```

### Direct Docker Command
Alternatively, you can run the container directly:

```bash
docker run --rm -it --name mae-ghostscript \
  -v "$(pwd)/pdf-files:/app/pdf-files" \
  -e "INPUT_PDF=your-input-file.pdf" \
  maemresen/mae-ghostscript
```

## Environment Variables
- `INPUT_PDF`: The name of the input PDF file to be compressed.

Ensure that the `INPUT_PDF` file is located in the `pdf-files` directory.

## Building the Docker Image
To build the Docker image locally:

```bash
docker build --no-cache -t maemresen/mae-ghostscript .
```

## Pushing the Docker Image to Docker Hub
1. Log in to Docker Hub:
   ```bash
   docker login -u <your-dockerhub-username> -p <your-password>
   ```
2. Tag and push the image:
   ```bash
   docker tag mae-ghostscript maemresen/mae-ghostscript:latest
   docker push maemresen/mae-ghostscript:latest
   ```

## License
This project is licensed under the [MIT License](LICENSE).

## Author
Mehmet Arif Emre Sen
