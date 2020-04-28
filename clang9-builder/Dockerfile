FROM ubuntu:20.04 as clang9-builder

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="helicsdevelopers@helics.org"

RUN apt update && apt install -y \
  libzmq5-dev build-essential\
  clang-9 libc++-9-dev libc++abi-9-dev libstdc++-9-dev\
  cmake git libboost-dev && apt-get clean\
  && ln -s /usr/bin/llvm-symbolizer-9 /usr/bin/llvm-symbolizer\
  && ln -s /usr/bin/clang++-9 /usr/bin/clang++\
  && ln -s /usr/bin/clang-9 /usr/bin/clang

WORKDIR /root/develop
