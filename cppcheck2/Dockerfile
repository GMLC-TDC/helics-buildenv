# This Dockerfile creates an image with cppcheck2.0

FROM ubuntu:20.04 as builder

# Installs dependencies needed for building, with headers needed for development
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  git g++ libz3-dev cmake libpcre3-dev

WORKDIR /root

RUN git clone --recurse-submodules https://github.com/danmar/cppcheck.git

WORKDIR /root/cppcheck2

RUN cmake -DUSE_Z3=ON -DHAVE_RULES=ON -DMATCHCOMPILER=ON -DCMAKE_BUILD_TYPE=Release -DENABLE_OSS_FUZZ=OFF ../cppcheck
RUN make -j4 && make install


# Create an image for generating HELICS interfaces
FROM ubuntu:20.04 as Hbase

# Install the tools for building
RUN apt update && apt install -y libz3 libpcre3 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the swig-matlab install from the builder image stage
COPY --from=builder /usr/local/Share/Cppcheck /usr/local/Share/Cppcheck
COPY --from=builder /usr/local/bin/cppcheck /usr/local/bin/cppcheck
