FROM dokken/centos-stream-8:sha-40294ce

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* &&
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* &&
    dnf install -y epel-release cmake 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled powertools && \
    dnf install -y libaio gtest gmock gflags fuse libgsasl zstd --allowerasing &&\
    dnf clean all && rm -rf /var/cache/yum
