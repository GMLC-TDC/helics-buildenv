FROM fedora:34 as builder

RUN dnf -y update && dnf -y install \
  zeromq-devel boost-filesystem boost-devel \
  boost-system boost-test boost-date-time \
  gcc gcc-c++ suitesparse-devel openmpi-devel \
  cmake git wget && dnf clean all \
  	&& rm -rf /var/cache/yum
  
LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2021-06-15"
