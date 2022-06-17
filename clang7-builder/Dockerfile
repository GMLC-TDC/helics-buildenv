FROM ubuntu:20.04 as clang-builder7

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev build-essential \
  libboost-filesystem1.67-dev \
  libboost-system1.67-dev libboost-test1.67-dev libboost-date-time1.67-dev \
  libsodium-dev libssl-dev openssl \
  clang-7 \
  cmake git wget swig mpich libboost1.67-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/llvm-symbolizer-7 /usr/bin/llvm-symbolizer \
  && ln -s /usr/bin/clang++-7 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-7 /usr/bin/clang

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-06-17"
