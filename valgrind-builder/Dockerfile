# Used for valgrind runs
FROM ubuntu:22.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev libboost-filesystem-dev \
  libboost-system-dev libboost-test-dev libboost-date-time-dev \
  g++ gcc cmake git wget swig mpi-default-dev valgrind \
  && apt-get install -y --no-install-recommends \
  pkg-config libboost-dev make \
  && apt-get clean \
  && pip3 install pytest \
  && rm -rf /var/lib/apt/lists/*

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-03-16"
