FROM ubuntu:20.04 as clang10-builder

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="helicsdevelopers@helics.org"

# updated 2020-05-07

RUN apt update && apt install -y \
  libzmq5-dev build-essential \
  clang-10 libc++-10-dev libc++abi-10-dev libstdc++-10-dev\
  cmake git wget libboost-dev && apt-get clean\
  && ln -s /usr/bin/llvm-symbolizer-10 /usr/bin/llvm-symbolizer\
  && ln -s /usr/bin/clang++-10 /usr/bin/clang++\
  && ln -s /usr/bin/clang-10 /usr/bin/clang

WORKDIR /root/develop
