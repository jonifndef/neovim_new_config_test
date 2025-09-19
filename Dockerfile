FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
    git \
    ca-certificates

WORKDIR /home/ubuntu
