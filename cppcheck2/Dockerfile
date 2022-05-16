# This Dockerfile creates an image with cppcheck2.0

FROM ubuntu:22.04 as builder

# Installs dependencies needed for building, with headers needed for development
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  git g++ libz3-dev cmake libpcre3-dev python3

WORKDIR /root

RUN git clone --recurse-submodules https://github.com/danmar/cppcheck.git

WORKDIR /root/cppcheck2

RUN cmake -DUSE_Z3=ON -DHAVE_RULES=ON -DUSE_MATCHCOMPILER=ON -DCMAKE_BUILD_TYPE=Release -DENABLE_OSS_FUZZ=OFF ../cppcheck
RUN make -j4 && make install


# Create an image for generating HELICS interfaces
FROM ubuntu:22.04 as Hbase

# Install the tools for building
RUN apt update && apt install -y libz3-4 libpcre3 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-05-16"

# Copy cppcheck to the install location
COPY --from=builder /usr/local/share/Cppcheck /usr/local/share/Cppcheck
COPY --from=builder /usr/local/bin/cppcheck /usr/local/bin/cppcheck
