FROM ubuntu:20.04 as builder

RUN apt update && apt install -y \
  libzmq5-dev\
  g++-8 gcc-8\
  cmake git 

RUN apt-get install -y --no-install-recommends pkg-config libboost-dev make && apt-get clean

RUN rm /usr/bin/gcc && ln -s /usr/bin/gcc-8 /usr/bin/gcc \
  && ln -s /usr/bin/g++-8 /usr/bin/g++ \
  && rm /usr/bin/gcc-ar && ln -s /usr/bin/gcc-ar-8 /usr/bin/gcc-ar \
  && rm /usr/bin/gcc-nm && ln -s /usr/bin/gcc-nm-8 /usr/bin/gcc-nm \
  && rm /usr/bin/gcc-ranlib && ln -s /usr/bin/gcc-ranlib-8 /usr/bin/gcc-ranlib

WORKDIR /root/develop