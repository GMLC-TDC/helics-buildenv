ARG BASE_IMAGE=ubuntu:19.04
FROM $BASE_IMAGE

# Packages that aren't likely to change frequently first to take advantage of layer caching
RUN apt-get update; \
    apt-get install -y --no-install-suggests --no-install-recommends \
        gnupg1 \
	ca-certificates \
	ssh-client \
	curl \
	cmake \
	make \
	ninja-build \
	git \
	swig \
	libzmq3-dev \
    ; \
    apt-get autoremove --purge -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

# Clang 3, 4, 5 are not available on disco
# gcc 4 and 5 are not available on disco
# Package install that may depend on arguments
ARG COMPILER=g++-4.9
# The MPI_VARIANT can be either "mpich" or "openmpi"
ARG MPI_VARIANT
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak; \
    distro="disco" ; \
    case $COMPILER in g??-4*) distro="xenial";; g??-5*) distro="xenial";; clang-3*) distro="xenial";; clang-4*) distro="xenial";; clang-5*) distro="xenial";; esac; \
    echo "Using packages for distro $distro" ;\
    case $distro in "disco") ;; *) \
        echo "deb http://dk.archive.ubuntu.com/ubuntu/ $distro main" >> /etc/apt/sources.list ; \
        echo "deb http://dk.archive.ubuntu.com/ubuntu/ $distro universe" >> /etc/apt/sources.list ; \
    ;; esac; \
    if [ "${MPI_VARIANT-}" = openmpi ]; then MPI_PACKAGE="libopenmpi-dev"; fi; \
    apt-get update; \
    apt-get install -y --no-install-suggests --no-install-recommends \
    	${COMPILER} \
	${MPI_PACKAGE} \
    ; \
    case $COMPILER in \
        g??-*) \
	    gcc_version=${COMPILER##g??-} ; \
	    ln -s -f $(which gcc-${gcc_version}) /usr/bin/cc ; \
	    ln -s -f $(which g++-${gcc_version}) /usr/bin/c++ ; \
	    ln -s -f $(which gcc-${gcc_version}) /usr/bin/gcc ; \
	    ln -s -f $(which g++-${gcc_version}) /usr/bin/g++ ; \
	;; \
	*) \
	    ln -s -f $(which ${COMPILER}) /usr/bin/cc ; \
	    ln -s -f $(which ${COMPILER}) /usr/bin/c++ ; \
	    ln -s -f $(which ${COMPILER}) /usr/bin/clang ; \
	    ln -s -f $(which "${COMPILER}++") /usr/bin/clang++ ; \
	;; \
    esac; \
    cp /etc/apt/sources.list.bak /etc/apt/sources.list ; \
    rm /etc/apt/sources.list.bak ; \
    apt-get autoremove --purge -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

# Compile and install MPICH (Ubuntu package depends on g++, OpenMPI package doesn't)
ARG MPICH_VERSION=3.2
RUN MPICH_VERSION_STR=mpich-$(echo $MPICH_VERSION | sed -e 's/\./_/g'); \
    if [ "${MPI_VARIANT-}" != mpich ]; then exit; fi; \
    mkdir /mpich_build && cd /mpich_build; \
    curl -sSL -O http://www.mpich.org/static/downloads/${MPICH_VERSION}/${MPICH_VERSION_STR}.tar.gz; \
    tar xfz ${MPICH_VERSION_STR}.tar.gz;\
    cd ${MPICH_VERSION_STR}; \
    mkdir -p build && cd build; \
    ./configure \
        --disable-dependency-tracking \
        --enable-fast=yes \
        --enable-g=none \
        --enable-timing=none \
        --enable-shared \
        --disable-static \
        --disable-java \
        --disable-fortran \
        --enable-threads=serialized; \
    make install; \
    cd / && rm -rf /mpich_build;

# Compile and install Boost
ARG BOOST_VERSION=1.65.0
RUN BOOST_VERSION_STR=boost_$(echo $BOOST_VERSION | sed -e 's/\./_/g'); \
    mkdir /boost_build && cd /boost_build; \
    curl -sSL -O http://downloads.sourceforge.net/project/boost/boost/${BOOST_VERSION}/${BOOST_VERSION_STR}.tar.gz; \
    tar xfz ${BOOST_VERSION_STR}.tar.gz; \
    cd ${BOOST_VERSION_STR}; \
    toolset=$(echo ${COMPILER%%-*} | sed -e 's/g++/gcc/'); \
    ./bootstrap.sh --with-libraries=test --with-toolset=${toolset}; \
    ./b2 install; \
    cd / && rm -rf /boost_build;
