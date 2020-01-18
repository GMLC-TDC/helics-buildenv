FROM ubuntu:18.04 as clang-builder8

RUN apt update && apt install -y \
  libzmq5-dev build-essential\
  clang-8 libc++-8-dev libc++abi-8-dev libstdc++-8-dev\
  cmake git libboost-dev && apt-get clean\
  && ln -s /usr/bin/llvm-symbolizer-8 /usr/bin/llvm-symbolizer\
  && ln -s /usr/bin/clang++-8 /usr/bin/clang++\
  && ln -s /usr/bin/clang-8 /usr/bin/clang

WORKDIR /root/develop
