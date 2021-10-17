FROM ubuntu:18.04

RUN  apt-get update
RUN apt-get install -y build-essential \
        lzop \
        u-boot-tools \
        net-tools \
        bison \
        flex \
        libssl-dev \
        libncurses5-dev \
        libncursesw5-dev \
        unzip \
        chrpath \
        xz-utils \
        minicom \
        wget \
        git-core

WORKDIR /root
RUN wget https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
RUN tar xvf gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
ENV PREFIX=/root/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf
ENV PATH=$PATH:$PREFIX/bin

RUN apt-get install -y linux-headers-$(uname -r)

RUN apt-get install -y gparted \
        git \
        bc \
        kmod \
        file \
        tree \
        cpio

RUN apt-get install -y device-tree-compiler

ENTRYPOINT /bin/bash

