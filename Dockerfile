FROM openanolis/anolisos:8.8

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN dnf install -y git gcc-c++ cmake 'dnf-command(config-manager)' && \
    dnf install -y gcc-toolset-9-gcc-c++ && \
    dnf install -y openssl-devel libcurl-devel libaio-devel && \
    dnf install -y epel-release && \
    dnf config-manager --set-enabled powertools && \
    dnf install -y gtest-devel gmock-devel gflags-devel fuse-devel libgsasl-devel e2fsprogs-devel && \
    dnf clean all && rm -rf /var/cache/yum
