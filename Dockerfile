FROM openanolis/anolisos:23

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN dnf install -y epel-release cmake 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled powertools && \
    dnf install -y libaio gtest gmock gflags fuse libgsasl zstd --allowerasing &&\
    dnf clean all && rm -rf /var/cache/yum
