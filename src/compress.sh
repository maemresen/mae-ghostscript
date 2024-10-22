#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.pdf output.pdf"
  exit 1
fi

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
  -dBATCH "-sOutputFile=$2" $1