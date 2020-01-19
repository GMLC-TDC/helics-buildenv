FROM opensuse/tumbleweed:latest

RUN zypper mr -d openSUSE-Tumbleweed-Update && zypper install -y make gcc-c++ boost-devel cmake git libzmq5 && zypper clean -a

WORKDIR /root/develop
