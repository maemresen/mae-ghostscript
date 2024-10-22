#!/bin/sh

if [ -z "$INPUT_PDF" ]; then
  echo "Error: Please set INPUT_PDF environment variables."
  echo "Usage: INPUT_PDF=input.pdf OUTPUT_PDF=output.pdf ./compress.sh"
  exit 1
fi

TIMESTAMP=$(date +"%Y_%m_%d-%H_%M_%S")
OUTPUT_PDF="${INPUT_PDF%.pdf}-compressed-${TIMESTAMP}.pdf"

gs -sDEVICE=pdfwrite \
  -dCompatibilityLevel=1.4 \
  -dDownsampleColorImages=true \
  -dColorImageDownsampleType=/Bicubic \
  -dColorImageResolution=144 \
  -dGrayImageDownsampleType=/Bicubic \
  -dGrayImageResolution=144 \
  -dMonoImageDownsampleType=/Bicubic \
  -dMonoImageResolution=144 \
  -dPDFSETTINGS=/ebook \
  -dNOPAUSE \
  -dQUIET \
  -dBATCH "-sOutputFile=pdf-files/$OUTPUT_PDF" "pdf-files/$INPUT_PDF"