FROM ubuntu:20.04 as clang9-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  libzmq5-dev build-essential libboost-filesystem1.71-dev \
  libboost-system1.71-dev libboost-test1.71-dev libboost-date-time1.71-dev \
  clang-9 libc++-9-dev libc++abi-9-dev libstdc++-9-dev libsuitesparse-dev \
  libsodium-dev libssl-dev openssl \
  cmake git wget libboost1.71-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/llvm-symbolizer-9 /usr/bin/llvm-symbolizer\
  && ln -s /usr/bin/clang++-9 /usr/bin/clang++\
  && ln -s /usr/bin/clang-9 /usr/bin/clang

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2021-03-08"
