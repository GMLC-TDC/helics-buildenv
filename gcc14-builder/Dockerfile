FROM ubuntu:24.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip python3-pytest libzmq5-dev libboost-filesystem-dev \
  libboost-system-dev libboost-test-dev libboost-date-time-dev \
  g++-14 gcc-14 mpi-default-dev libsuitesparse-dev \
  libsodium-dev libssl-dev openssl \
  cmake git wget swig && apt-get install -y --no-install-recommends \
  pkg-config libboost-dev make && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm /usr/bin/gcc && ln -s /usr/bin/gcc-14 /usr/bin/gcc \
  && rm /usr/bin/g++ && ln -s /usr/bin/g++-14 /usr/bin/g++ \
  && rm /usr/bin/gcc-ar && ln -s /usr/bin/gcc-ar-14 /usr/bin/gcc-ar \
  && rm /usr/bin/gcc-nm && ln -s /usr/bin/gcc-nm-14 /usr/bin/gcc-nm \
  && rm /usr/bin/gcc-ranlib && ln -s /usr/bin/gcc-ranlib-14 /usr/bin/gcc-ranlib

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2024-05-03"
