FROM ubuntu:22.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev libboost-filesystem-dev \
  libboost-system-dev libboost-test-dev libboost-date-time-dev \
  g++-12 gcc-12 mpi-default-dev libsuitesparse-dev \
  libsodium-dev libssl-dev openssl \
  cmake git wget swig && apt-get install -y --no-install-recommends \
  pkg-config libboost-dev make && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && pip3 install pytest

RUN rm /usr/bin/gcc && ln -s /usr/bin/gcc-12 /usr/bin/gcc \
  && rm /usr/bin/g++ && ln -s /usr/bin/g++-12 /usr/bin/g++ \
  && rm /usr/bin/gcc-ar && ln -s /usr/bin/gcc-ar-12 /usr/bin/gcc-ar \
  && rm /usr/bin/gcc-nm && ln -s /usr/bin/gcc-nm-12 /usr/bin/gcc-nm \
  && rm /usr/bin/gcc-ranlib && ln -s /usr/bin/gcc-ranlib-12 /usr/bin/gcc-ranlib

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-05-16"
