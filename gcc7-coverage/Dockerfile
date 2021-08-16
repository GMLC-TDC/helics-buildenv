FROM ubuntu:18.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  python3-dev python3-pip libzmq5-dev libboost-filesystem1.65-dev \
  libboost-system1.65-dev libboost-test1.65-dev libboost-date-time1.65-dev \
  g++-7 gcc-7 libsuitesparse-dev\
  cmake git wget curl && apt-get install -y --no-install-recommends \
  libboost1.65-dev make lcov && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && pip3 install pytest

RUN rm /usr/bin/gcc && ln -s /usr/bin/gcc-7 /usr/bin/gcc \
  && rm /usr/bin/g++ && ln -s /usr/bin/g++-7 /usr/bin/g++ \
  && rm /usr/bin/gcc-ar && ln -s /usr/bin/gcc-ar-7 /usr/bin/gcc-ar \
  && rm /usr/bin/gcc-nm && ln -s /usr/bin/gcc-nm-7 /usr/bin/gcc-nm \
  && rm /usr/bin/gcc-ranlib && ln -s /usr/bin/gcc-ranlib-7 /usr/bin/gcc-ranlib

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2021-08-16"
