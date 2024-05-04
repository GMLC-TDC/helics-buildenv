FROM ubuntu:24.04 as clang14-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip python3-pytest libzmq5-dev build-essential \
  clang-17 clang-tidy-17 libc++-17-dev libc++abi-17-dev libstdc++-13-dev \
  libsodium-dev libssl-dev openssl \
  cmake git wget swig mpich libboost-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/llvm-symbolizer-17 /usr/bin/llvm-symbolizer \
  && ln -s /usr/bin/clang++-17 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-17 /usr/bin/clang \
  && ln -s /usr/bin/clang-tidy-17 /usr/bin/clang-tidy

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2024-05-03"
