FROM ubuntu:20.04 as clang-builder7

RUN apt update && apt install -y \
  libzmq5-dev build-essential \
  clang-8 libc++-7-dev libc++abi-7-dev libstdc++-7-dev \
  libsodium-dev libssl-dev openssl \
  cmake git libboost-dev && apt-get clean \
  && ln -s /usr/bin/llvm-symbolizer-7 /usr/bin/llvm-symbolizer \
  && ln -s /usr/bin/clang++-7 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-7 /usr/bin/clang

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-06-16"
