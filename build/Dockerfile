FROM ubuntu:wily

RUN sed -i 's#archive.ubuntu.com#mirrors.aliyun.com#' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y git make g++ libevent-dev libmysqlclient-dev libpq-dev zlib1g-dev libpcre3-dev bison python wget tar gzip patch \
        --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
