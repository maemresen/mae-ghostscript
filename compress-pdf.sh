#!/bin/bash

# Check if both input and output PDF file paths are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.pdf output.pdf"
  exit 1
fi

# Assign the input and output arguments to variables
INPUT_PDF=$1
OUTPUT_PDF=$2

# Run the Docker Compose command to use the ghostscript service
echo "Running temporary container via Docker Compose to compress the PDF..."

docker run --name mae-ghostscript -v "$(pwd)/resources:/usr/src/app/pdf-files" mae-ghostscript mae-ghostscript "pdf-files/$INPUT_PDF" "pdf-files/$OUTPUT_PDF"

# Check if the compression was successful
if [ $? -eq 0 ]; then
  echo "PDF compression completed successfully! Output saved to $OUTPUT_PDF."
else
  echo "Failed to compress the PDF."
  exit 1
fi