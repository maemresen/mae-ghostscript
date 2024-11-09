# mae-ghostscript

## Overview
`mae-ghostscript` is a Docker-based tool designed for compressing PDF files using Ghostscript. This repository includes a Docker image that streamlines the PDF compression process in a consistent, containerized environment. For more details, visit the [GitHub repository](https://github.com/maemresen/mae-ghostscript).

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
2. Run the Docker command directly.

### Direct Docker Command
Run the container using the following command:

```bash
docker run --rm -it --name mae-ghostscript \
  -v "$(pwd)/pdf-files:/app/pdf-files" \
  -e "INPUT_PDF=your-input-file.pdf" \
  maemresen/mae-ghostscript
```

### Output File Pattern
The output file will be generated with the pattern `<input-filename>-compressed-<timestamp>.pdf`, where `<input-filename>` is the name of the input file without the `.pdf` extension, and `<timestamp>` is the current date and time. The compressed file will be located in the `pdf-files` directory.

**Example:**
- Input file: `example.pdf`
- Output file: `example-compressed-2024_11_09-12_30_45.pdf`

## Environment Variables
- `INPUT_PDF`: The name of the input PDF file to be compressed.

Ensure that the `INPUT_PDF` file is located in the `pdf-files` directory.

## Building the Docker Image
To build the Docker image locally:

```bash
docker build --no-cache -t maemresen/mae-ghostscript .
```

## License
This project is licensed under the [MIT License](LICENSE).

## Author
Mehmet Arif Emre Sen
