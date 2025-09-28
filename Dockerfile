FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    curl \
    git

RUN (getent group 1000 || groupadd -g 1000 ubuntu) && \
    (getent passwd 1000 || useradd -m -u 1000 -g 1000 -s /bin/bash ubuntu || true) && \
    mkdir -p /home/ubuntu && \
    chown -R 1000:1000 /home/ubuntu || true

USER ubuntu

WORKDIR /home/ubuntu
