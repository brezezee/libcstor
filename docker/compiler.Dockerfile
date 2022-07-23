FROM ubuntu:18.04 as build

# install all the build dependencies
RUN apt-get update -qq && \
    apt-get install --yes -qq gcc-6 g++-6 linux-headers-generic build-essential autoconf \
    libtool gawk alien fakeroot libaio-dev jq zlib1g-dev uuid-dev libattr1-dev libblkid-dev \
    parted lsscsi ksh attr acl nfs-kernel-server libgtest-dev cmake git \
    libselinux-dev libudev-dev libssl-dev libjson-c-dev lcov libjemalloc-dev gdb && \
    unlink /usr/bin/gcc && ln -s /usr/bin/gcc-6 /usr/bin/gcc && \
    unlink /usr/bin/g++ && ln -s /usr/bin/g++-6 /usr/bin/g++ 

