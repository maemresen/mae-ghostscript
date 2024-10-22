#!/bin/bash

# Check if both input and output PDF file paths are provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input.pdf"
  exit 1
fi

# Assign the input and output arguments to variables
INPUT_PDF=$1

# Run the Docker Compose command to use the ghostscript service
echo "Running temporary container via Docker to compress the PDF..."

docker run --rm -it --name mae-ghostscript \
  -v "$(pwd)/pdf-files:/app/pdf-files" \
  -e "INPUT_PDF=$INPUT_PDF" \
  mae-ghostscript

# Check if the compression was successful
if [ $? -eq 0 ]; then
  echo "PDF compression completed successfully!"
else
  echo "Failed to compress the PDF."
  exit 1
fi