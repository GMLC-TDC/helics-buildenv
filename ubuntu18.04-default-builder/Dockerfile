FROM ubuntu:18.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  libzmq5-dev libboost-filesystem-dev \
  libboost-system-dev libboost-test-dev libboost-date-time-dev \
  g++ gcc cmake git wget swig mpi-default-dev \
  && apt-get install -y --no-install-recommends \
  pkg-config libboost-dev make && apt-get clean && rm -rf /var/lib/apt/lists/*

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2020-07-31"

WORKDIR /root/develop
