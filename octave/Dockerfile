FROM ubuntu:18.04 as builder

RUN apt update && apt install -y \
  libboost-dev \
  libzmq5-dev python3-dev \
  build-essential swig cmake git wget

WORKDIR /root/develop

RUN apt update && apt install -y --no-install-recommends libzmq5 octave liboctave-dev

ENV PYTHONPATH /usr/local/python

# Python must be installed after the PYTHONPATH is set above for it to
# recognize and import libhelicsSharedLib.so
RUN apt install -y --no-install-recommends python3-dev \
  && apt-get clean

