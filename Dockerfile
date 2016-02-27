FROM ubuntu:wily

RUN sed -i 's#archive.ubuntu.com#mirrors.aliyun.com#' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y libevent-2.0 libmysqlclient18 libpq5 zlib1g libpcre3 \
        --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY bin/driver bin/portbind bin/dtrace_compile /usr/bin/

ENTRYPOINT ["/usr/bin/driver"]
