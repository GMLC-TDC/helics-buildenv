FROM ubuntu:18.04 as clang5-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev build-essential \
  libboost-filesystem1.65-dev \
  libboost-system1.65-dev libboost-test1.65-dev libboost-date-time1.65-dev \
  libsodium-dev libssl-dev openssl \
  clang-5.0 \
  cmake git wget swig mpich libboost1.65-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/clang++-5.0 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-5.0 /usr/bin/clang \
  && pip3 install pytest

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2020-03-08"
