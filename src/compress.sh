#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.pdf output.pdf"
  exit 1
fi

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH -dQUIET -sOutputFile="$2" "$1"

gs -sDEVICE=pdfwrite \
  -dCompatibilityLevel=1.4 \
  -dPDFSETTINGS=/ebook \
  -dNOPAUSE \
  -dQUIET \
  -dBATCH "-sOutputFile=$2" $1