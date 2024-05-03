# Used for valgrind runs
FROM helics/buildenv:ubuntu24.04-default-builder as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
  libzmq5 octave liboctave-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2024-05-03"
