FROM openanolis/anolisos:8.8

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN dnf install -y git cmake gcc-toolset-9-gcc-c++ openssl-devel libcurl-devel libaio-devel sudo zstd wget && \
    dnf install -y epel-release && \
    dnf install -y gtest-devel gmock-devel fuse-devel libgsasl-devel e2fsprogs-devel && \
    dnf clean all && rm -rf /var/cache/yum && \
    wget https://github.com/gflags/gflags/archive/refs/tags/v2.1.2.tar.gz -O - | tar -xvz && \
    source /opt/rh/gcc-toolset-9/enable && \
    cd gflags-2.1.2 && export CXXFLAGS="-fPIC" && cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBUILD_SHARED_LIBS=1 -DBUILD_STATIC_LIBS=1 . && make -j 8 && make install && \
    cd .. && rm -rf gflags-2.1.2 && ln -s libgflags.so.2.1.2 /usr/local/lib/libgflags.so.2.1
