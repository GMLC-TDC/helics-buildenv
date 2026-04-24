FROM ubuntu:26.04 AS clang21-builder


ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip python3-pytest libzmq5-dev build-essential \
  clang-21 clang-tidy-21 libc++-21-dev libc++abi-21-dev libstdc++-14-dev \
  libsodium-dev libssl-dev openssl libsuitesparse-dev\
  cmake git wget swig mpich libboost-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/llvm-symbolizer-21 /usr/bin/llvm-symbolizer \
  && ln -s /usr/bin/clang++-21 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-21 /usr/bin/clang \
  && ln -s /usr/bin/clang-tidy-21 /usr/bin/clang-tidy

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2026-04-24"