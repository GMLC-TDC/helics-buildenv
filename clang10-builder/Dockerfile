FROM ubuntu:20.04 as clang10-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev build-essential \
  clang-10 libc++-10-dev libc++abi-10-dev libstdc++-10-dev \
  libsodium-dev libssl-dev openssl \
  cmake git wget swig mpich libboost-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && pip3 install pytest \
  && ln -s /usr/bin/llvm-symbolizer-10 /usr/bin/llvm-symbolizer \
  && ln -s /usr/bin/clang++-10 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-10 /usr/bin/clang

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2021-03-05"
