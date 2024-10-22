FROM debian:stable-slim
VOLUME /app/pdf-files
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y ghostscript && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY ./src/compress.sh compress.sh
RUN chmod +x compress.sh
ENTRYPOINT ["sh","/app/compress.sh"]