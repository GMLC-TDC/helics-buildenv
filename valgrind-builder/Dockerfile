# Used for valgrind runs
FROM helics/buildenv:ubuntu26.04-default-builder AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  valgrind \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2026-04-24"
