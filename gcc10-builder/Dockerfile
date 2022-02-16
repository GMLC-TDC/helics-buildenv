FROM ubuntu:20.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  default-jdk python3-dev python3-pip libzmq5-dev libboost-filesystem1.71-dev \
  libboost-system1.71-dev libboost-test1.71-dev libboost-date-time1.71-dev \
  g++-10 gcc-10 mpi-default-dev libsuitesparse-dev \
  libsodium-dev libssl-dev openssl \
  cmake git wget swig && apt-get install -y --no-install-recommends \
  pkg-config libboost1.71-dev make && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && pip3 install pytest

RUN rm /usr/bin/gcc && ln -s /usr/bin/gcc-10 /usr/bin/gcc \
  && rm /usr/bin/g++ && ln -s /usr/bin/g++-10 /usr/bin/g++ \
  && rm /usr/bin/gcc-ar && ln -s /usr/bin/gcc-ar-10 /usr/bin/gcc-ar \
  && rm /usr/bin/gcc-nm && ln -s /usr/bin/gcc-nm-10 /usr/bin/gcc-nm \
  && rm /usr/bin/gcc-ranlib && ln -s /usr/bin/gcc-ranlib-10 /usr/bin/gcc-ranlib
  
LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2021-03-08"
