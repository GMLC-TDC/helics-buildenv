FROM ubuntu:24.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

ENV PYTHONPATH /usr/local/python

RUN apt update && apt install -y \
  default-jdk python3-full python3-dev python3-pip libzmq5-dev libboost-filesystem-dev \
  libboost-system-dev libboost-test-dev libboost-date-time-dev \
  g++ gcc cmake git curl wget swig lcov mpi-default-dev \
  libsodium-dev libssl-dev openssl python3-pytest \
  && apt-get install -y --no-install-recommends \
  pkg-config libboost-dev make \
  && apt-get clean && rm -rf /var/lib/apt/lists/* 

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2024-05-04"
