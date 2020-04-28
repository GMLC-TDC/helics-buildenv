FROM ubuntu:20.04 as builder

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="helicsdevelopers@helics.org"

# updated 2020-04-28

RUN apt update && apt install -y \
  libzmq5-dev\
  g++-10 gcc-10\
  cmake git

RUN apt-get install -y --no-install-recommends pkg-config libboost-dev make && apt-get clean

RUN rm /usr/bin/gcc && ln -s /usr/bin/gcc-10 /usr/bin/gcc \
  && ln -s /usr/bin/g++-10 /usr/bin/g++ \
  && rm /usr/bin/gcc-ar && ln -s /usr/bin/gcc-ar-10 /usr/bin/gcc-ar \
  && rm /usr/bin/gcc-nm && ln -s /usr/bin/gcc-nm-10 /usr/bin/gcc-nm \
  && rm /usr/bin/gcc-ranlib && ln -s /usr/bin/gcc-ranlib-10 /usr/bin/gcc-ranlib

WORKDIR /root/develop