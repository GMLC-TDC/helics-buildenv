FROM ubuntu:20.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  libzmq5-dev libboost-filesystem1.71-dev \
  libboost-system1.71-dev libboost-test1.71-dev libboost-date-time1.71-dev \
  g++ gcc libsuitesparse-dev \
  cmake git wget && apt-get install -y --no-install-recommends \
  pkg-config libboost1.71-dev make && apt-get clean && rm -rf /var/lib/apt/lists/*

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2021-03-08"
