FROM ubuntu:18.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  libzmq5-dev \
  g++-4.8 gcc-4.8  \
  cmake git wget && apt-get install -y --no-install-recommends \
  make && apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN rm -f /usr/bin/gcc && ln -s /usr/bin/gcc-4.8 /usr/bin/gcc \
  && rm -f /usr/bin/g++ && ln -s /usr/bin/g++-4.8 /usr/bin/g++ \
  && rm -f /usr/bin/gcc-ar && ln -s /usr/bin/gcc-ar-4.8 /usr/bin/gcc-ar \
  && rm -f /usr/bin/gcc-nm && ln -s /usr/bin/gcc-nm-4.8 /usr/bin/gcc-nm \
  && rm -f /usr/bin/gcc-ranlib && ln -s /usr/bin/gcc-ranlib-4.8 /usr/bin/gcc-ranlib

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-08-23"
