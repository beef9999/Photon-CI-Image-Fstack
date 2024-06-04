FROM dokken/centos-8:sha-d80eb77

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN dnf install -y epel-release cmake 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled powertools && \
    dnf install -y libaio gtest gmock gflags fuse libgsasl zstd --allowerasing &&\
    dnf clean all && rm -rf /var/cache/yum
