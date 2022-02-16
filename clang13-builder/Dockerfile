FROM ubuntu:20.04 as clang13-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y software-properties-common wget \
  && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
  && add-apt-repository -y "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" \
  && apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev build-essential \
  libsodium-dev libssl-dev openssl \
  clang-13 libc++-13-dev libc++abi-13-dev libstdc++-10-dev \
  cmake git swig mpich libboost-dev ca-certificates \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && pip3 install pytest \
  && ln -s /usr/bin/llvm-symbolizer-13 /usr/bin/llvm-symbolizer \
  && ln -s /usr/bin/clang++-13 /usr/bin/clang++ \
  && ln -s /usr/bin/clang-13 /usr/bin/clang

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2021-10-21"
