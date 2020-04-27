FROM ubuntu:20.04 as builder

RUN apt update && apt install -y \
  libzmq5-dev\
  g++ gcc\
  cmake git

RUN apt-get install -y --no-install-recommends pkg-config libboost-dev make && apt-get clean

WORKDIR /root/develop
