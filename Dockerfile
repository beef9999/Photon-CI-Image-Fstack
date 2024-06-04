FROM openanolis/anolisos:8.8

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN dnf install -y git cmake gcc-toolset-9-gcc-c++ openssl-devel libcurl-devel libaio-devel sudo && \
    dnf install -y epel-release && \
    dnf install -y gtest-devel gmock-devel gflags-devel fuse-devel libgsasl-devel e2fsprogs-devel && \
    dnf clean all && rm -rf /var/cache/yum
