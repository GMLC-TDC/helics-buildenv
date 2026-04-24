FROM ubuntu:26.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

ENV PYTHONPATH /usr/local/python

RUN apt update && apt install -y \
  default-jdk python3-full python3-dev python3-pip libzmq5-dev \
  g++ gcc cmake git curl wget swig lcov mpi-default-dev \
  libsodium-dev libssl-dev openssl python3-pytest libsuitesparse-dev \
  && apt-get install -y --no-install-recommends \
  pkg-config libboost-dev make \
  && apt-get clean && rm -rf /var/lib/apt/lists/* 

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2026-04-24"
