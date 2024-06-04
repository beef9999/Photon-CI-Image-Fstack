FROM dokken/centos-stream-8:sha-40294ce

LABEL org.opencontainers.image.source=https://github.com/Coldwings/PhotonLibOS

RUN wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-8.repo && \
    yum clean all && yum makecache && \
    dnf install -y epel-release cmake 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled powertools && \
    dnf install -y libaio gtest gmock gflags fuse libgsasl zstd --allowerasing &&\
    dnf clean all && rm -rf /var/cache/yum
