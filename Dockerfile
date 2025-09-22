FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
    git \
    ca-certificates \
    curl

RUN groupadd -g 1000 ubuntu && useradd ubuntu -u 1000 -g 1000 -m -s /bin/bash

#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash; \. "/home/ubuntu/.nvm/nvm.sh"; nvm install 22

USER ubuntu

WORKDIR /home/ubuntu
