# helics-buildenv
[![Docker Image CI Status](https://github.com/GMLC-TDC/helics-buildenv/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/GMLC-TDC/helics-buildenv/actions)

**helics-buildenv** contains files related to setting up build environments for HELICS repositories. Right now it consists of Dockerfiles for generating images used in builds. The container images are pushed to [helics/buildenv](https://hub.docker.com/r/helics/buildenv) on Docker Hub.

## Dockerfiles
Each Dockerfile has its own directory that contains all the scripts needed to build it. A GitHub Actions workflow is setup to build and push updated Docker images to Docker Hub. To manually build a Dockerfile, go to its subfolder and then run `docker build . --tag "helics/buildenv:<tag>"`.

- *builder*: Creates an Ubuntu 19.10 image with the default ZMQ, Boost, CMake, git, and g++ packages.
- *ci-builders*: Creates Ubuntu 19.04 images with several compiler, Boost, and MPI versions. Arguments taken are COMPILER (e.g. gcc-4.9), MPI_VARIANT, MPICH_VERSION, and BOOST_VERSION.
- *clang-format*: An Alpine image with the tools needed to run clang-format installed.
- *interface-gen*: Creates a Fedora 31 image with SWIG 4.0.1 and SWIG Matlab (https://github.com/jaeandersson/swig) installed.
- *octave*: Creates an Ubuntu 18.04 image with Octave 4.2.2 installed.
- *sanitizers*: Creates an Ubuntu 19.10 image with clang sanitizers installed. The current image includes address, memory, and thread sanitizers with clang 9.

## Release
helics-buildenv is distributed under the terms of the BSD-3 clause license. All new
contributions must be made under this license. [LICENSE](LICENSE)

SPDX-License-Identifier: BSD-3-Clause
