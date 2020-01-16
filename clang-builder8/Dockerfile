FROM ubuntu:18.04 as clang-builder8

RUN apt update && apt install -y \
  libzmq5-dev build-essential\
  clang libc++-dev libc++abi-dev libstdc++-8-dev\
  cmake git libboost-dev && apt-get clean && ln -s /usr/bin/llvm-symbolizer-8 /usr/bin/llvm-symbolizer

WORKDIR /root/develop
