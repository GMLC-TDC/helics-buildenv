FROM helics/buildenv:clang9-builder as builder

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root/develop

RUN apt update && apt install -y ninja-build

RUN git clone -b llvmorg-9.0.1 https://github.com/llvm/llvm-project.git

# Sets the number of threads for make to use
ARG MAKE_PARALLEL

# Build the Memory sanitizer libraries
RUN mkdir libcxx_msan_build && cd libcxx_msan_build &&  cmake -GNinja -S runtimes ../llvm-project/runtimes -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" -DLLVM_USE_SANITIZER=MemoryWithOrigins -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
RUN cd libcxx_msan_build && cmake --build  . -j 3 -- cxx cxxabi

RUN mkdir -p /root/develop/libcxx_msan/include && cp -r /root/develop/libcxx_msan_build/include/* /root/develop/libcxx_msan/include/
RUN mkdir -p /root/develop/libcxx_msan/lib && cp -r /root/develop/libcxx_msan_build/lib/* /root/develop/libcxx_msan/lib/

# Build the ASAN libraries
RUN mkdir libcxx_asan_build && cd libcxx_asan_build &&  cmake -GNinja  -S runtimes ../llvm-project/runtimes -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" -DLLVM_USE_SANITIZER=Address -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
RUN cd libcxx_asan_build && cmake --build  . -j 3 -- cxx cxxabi

RUN mkdir -p /root/develop/libcxx_asan/include && cp -r /root/develop/libcxx_asan_build/include/* /root/develop/libcxx_asan/include/
RUN mkdir -p /root/develop/libcxx_asan/lib && cp -r /root/develop/libcxx_asan_build/lib/* /root/develop/libcxx_asan/lib/

# Build the tsan libraries
RUN mkdir libcxx_tsan_build && cd libcxx_tsan_build &&  cmake -GNinja  -S runtimes ../llvm-project/runtimes -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" -DLLVM_USE_SANITIZER=Thread -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
RUN cd libcxx_tsan_build && cmake --build  . -j 3 -- cxx cxxabi

RUN mkdir -p /root/develop/libcxx_tsan/include && cp -r /root/develop/libcxx_tsan_build/include/* /root/develop/libcxx_tsan/include/
RUN mkdir -p /root/develop/libcxx_tsan/lib && cp -r /root/develop/libcxx_tsan_build/lib/* /root/develop/libcxx_tsan/lib/

FROM helics/buildenv:clang9-builder

ENV DEBIAN_FRONTEND=noninteractive

# last updated 2022-05-19

# Copy the built libraries from the builder images
COPY --from=builder /root/develop/libcxx_asan /root/develop/libcxx_asan
COPY --from=builder /root/develop/libcxx_tsan /root/develop/libcxx_tsan
COPY --from=builder /root/develop/libcxx_msan /root/develop/libcxx_msan

# Copy scripts to build and run HELICS with the sanitizers
COPY helics_build_run_*.sh /root/develop/

ENV ASAN_CFLAGS="-fsanitize=undefined,address -stdlib=libc++ -L/root/develop/libcxx_asan/lib -lc++abi -I/root/develop/libcxx_asan/include -I/root/develop/libcxx_asan/include/c++/v1 -Wno-unused-command-line-argument -fno-omit-frame-pointer -g -O1 -Wl,-rpath=/root/develop/libcxx_asan/lib"

ENV MSAN_CFLAGS="-fsanitize=memory -stdlib=libc++ -L/root/develop/libcxx_msan/lib -lc++abi -I/root/develop/libcxx_msan/include -I/root/develop/libcxx_msan/include/c++/v1 -Wno-unused-command-line-argument -fno-omit-frame-pointer -g -O1 -Wl,-rpath=/root/develop/libcxx_msan/lib"

ENV TSAN_CFLAGS="-fsanitize=thread -stdlib=libc++ -L/root/develop/libcxx_tsan/lib -lc++abi -I/root/develop/libcxx_tsan/include -I/root/develop/libcxx_tsan/include/c++/v1 -Wno-unused-command-line-argument -g -O1 -Wl,-rpath=/root/develop/libcxx_tsan/lib"

LABEL maintainer="helicsdevelopers@helics.org"
LABEL date="2022-05-19"
