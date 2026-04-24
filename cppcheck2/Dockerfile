# This Dockerfile creates an image with cppcheck2.0

FROM ubuntu:26.04 AS builder

# Installs dependencies needed for building, with headers needed for development
ENV DEBIAN_FRONTEND=noninteractive
ARG CPPCHECK_VERSION=2.20.1

RUN apt update && apt install -y \
  git g++ libz3-dev cmake libpcre3-dev python3

WORKDIR /root

RUN git clone --recurse-submodules https://github.com/danmar/cppcheck.git
RUN cd /root/cppcheck && git checkout "${CPPCHECK_VERSION}" && git submodule update --init --recursive

WORKDIR /root/cppcheck2

RUN cmake -DUSE_Z3=ON -DHAVE_RULES=ON -DUSE_MATCHCOMPILER=ON -DCMAKE_BUILD_TYPE=Release -DENABLE_OSS_FUZZ=OFF ../cppcheck
RUN make -j4 && make install


# Create an image for generating HELICS interfaces
FROM ubuntu:26.04 AS Hbase

# Install the tools for building
RUN apt update && apt install -y libz3-4 libpcre3 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2026-04-24"

# Copy cppcheck to the install location
COPY --from=builder /usr/local/share/Cppcheck /usr/local/share/Cppcheck
COPY --from=builder /usr/local/bin/cppcheck /usr/local/bin/cppcheck
