FROM ubuntu:20.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  libzmq5-dev libboost-filesystem1.71-dev \
  libboost-system1.71-dev libboost-test1.71-dev libboost-date-time1.71-dev \
  g++-10 gcc-10 libsuitesparse-dev\
  cmake git wget swig && apt-get install -y --no-install-recommends \
  pkg-config libboost1.71-dev make && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm /usr/bin/gcc && ln -s /usr/bin/gcc-10 /usr/bin/gcc \
  && ln -s /usr/bin/g++-10 /usr/bin/g++ \
  && rm /usr/bin/gcc-ar && ln -s /usr/bin/gcc-ar-10 /usr/bin/gcc-ar \
  && rm /usr/bin/gcc-nm && ln -s /usr/bin/gcc-nm-10 /usr/bin/gcc-nm \
  && rm /usr/bin/gcc-ranlib && ln -s /usr/bin/gcc-ranlib-10 /usr/bin/gcc-ranlib
  
LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2020-05-08"

WORKDIR /root/develop
