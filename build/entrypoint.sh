#!/bin/bash

if [ ! -d "/fluffos-build.lock" ]; then
    apt-get update

    (wget -qO - http://ftpmirror.gnu.org/libiconv/libiconv-1.14.tar.gz | tar zxf - -C /tmp)
    cd /tmp/libiconv-1.14
    # libiconv remove gets declarations patch
    # https://github.com/paulczar/omnibus-fpm/blob/master/config/patches/libiconv/libiconv-1.14_srclib_stdio.in.h-remove-gets-declarations.patch
    cp /opt/projects/docker-fluffos/build/drop-gets.diff ./ && patch -p1 < drop-gets.diff
    make clean && ./configure --prefix=/usr && make -s && make install && rm -rf /tmp/libiconv-1.14

    cd /opt/projects/fluffos/src
    cp /opt/projects/docker-fluffos/build/{build.FluffOS,local_options} ./
    ./build.FluffOS && make

    cp ./{driver,dtrace_compile,portbind} /opt/projects/docker-fluffos/bin/
    rm -rf /var/lib/apt/lists/*
    
    touch /fluffos-build.lock
fi
