FROM dokken/centos-stream-8:sha-40294ce

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN sed -e 's/mirrorlist=.*//g' -e 's/#baseurl=/baseurl=/g' -e 's/mirror.centos.org/vault.centos.org/g' -i /etc/yum.repos.d/*.repo && \
    dnf install -y epel-release cmake 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled powertools && \
    dnf install -y libaio gtest gmock gflags fuse libgsasl zstd --allowerasing &&\
    dnf clean all && rm -rf /var/cache/yum
