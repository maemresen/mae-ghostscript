#!/bin/sh

# Check if input and output files are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.pdf output.pdf"
  exit 1
fi

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
   -dNOPAUSE -dBATCH -dQUIET \
   -sOutputFile="$2" "$1"