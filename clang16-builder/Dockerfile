FROM ubuntu:22.04 as clang14-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev build-essential \
  clang-16 clang-tidy-16 libc++-16-dev libc++abi-16-dev libstdc++-13-dev \
  libsodium-dev libssl-dev openssl \
  cmake git wget swig mpich libboost-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && pip3 install pytest \
  && ln -s /usr/bin/llvm-symbolizer-16 /usr/bin/llvm-symbolizer \
  && ln -s /usr/bin/clang++-16 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-16 /usr/bin/clang \
  && ln -s /usr/bin/clang-tidy-16 /usr/bin/clang-tidy

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2024-05-03"
