FROM opensuse/tumbleweed:latest

# 2022-05-21
LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-05-21"

#install the required components for building HELICS
RUN zypper mr -d openSUSE-Tumbleweed-Update && zypper install -y make gcc-c++ boost-devel cmake git libzmq5 zeromq-devel && zypper clean -a

WORKDIR /root/develop
