FROM ubuntu:18.04 as clang8-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  libzmq5-dev build-essential libboost-filesystem1.65-dev \
  libboost-system1.65-dev libboost-test1.65-dev libboost-date-time1.65-dev \
  clang-8 libc++-8-dev libc++abi-8-dev libstdc++-8-dev libsuitesparse-dev \
  cmake git wget libboost1.65-dev ca-certificates clang-tidy-8 \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/llvm-symbolizer-8 /usr/bin/llvm-symbolizer\
  && ln -s /usr/bin/clang++-8 /usr/bin/clang++\
  && ln -s /usr/bin/clang-8 /usr/bin/clang \
  && ln -s /usr/bin/clang-tidy-8 /usr/bin/clang-tidy

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2020-05-28"

WORKDIR /root/develop
