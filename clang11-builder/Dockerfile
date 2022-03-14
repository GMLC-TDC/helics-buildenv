FROM ubuntu:21.04 as clang11-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev build-essential \
  clang-11 libc++-11-dev libc++abi-11-dev libstdc++-11-dev \
  libsodium-dev libssl-dev openssl \
  cmake git wget swig mpich libboost-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && pip3 install pytest \
  && ln -s /usr/bin/llvm-symbolizer-11 /usr/bin/llvm-symbolizer \
  && ln -s /usr/bin/clang++-11 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-11 /usr/bin/clang

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-03-14"
