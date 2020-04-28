FROM ubuntu:20.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="helicsdevelopers@helics.org"

# updated 2020-04-28

RUN apt update && apt install -y \
  libzmq5-dev\
  g++ gcc\
  cmake git

RUN apt-get install -y --no-install-recommends pkg-config libboost-dev make && apt-get clean

WORKDIR /root/develop
