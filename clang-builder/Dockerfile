FROM ubuntu:19.10 as clang-builder

RUN apt update && apt install -y \
  libzmq5-dev\
  clang libc++-dev libc++abi-dev libstdc++-9-dev\
  cmake git 
  
RUN apt-get install -y --no-install-recommends libboost-dev make && apt-get clean && ln -s /usr/bin/llvm-symbolizer-9 /usr/bin/llvm-symbolizer

WORKDIR /root/develop
