FROM openanolis/anolisos:23

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN dnf install -y cmake libaio gtest gmock gflags fuse libgsasl zstd --allowerasing &&\
    dnf clean all && rm -rf /var/cache/yum
