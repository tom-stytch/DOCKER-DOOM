# USE ALPINE AS BASE IMAGE
FROM b0nam/alpine-novnc:base

# INSTALL DEPENDENCIES
RUN apk add \
    build-base \
    gcc \
    make \
    sdl2-dev \
    sdl2_net-dev \
    sdl2_mixer-dev \
    py-pillow \
    automake \
    autoconf \
    libtool \
    pkgconfig

# CLONE CRISPY-DOOM REPOSITORY
RUN git clone https://github.com/fabiangreffrath/crispy-doom.git

# DEFINE WORK DIRECTORY
WORKDIR /crispy-doom

# RUN COMPILATION COMMANDS
RUN autoreconf -fiv && \
    ./configure && \
    make && \
    make install

# GET DOOM1 WAD FILE
RUN wget -O doom-wad-shareware.tar.gz http://ftp.debian.org/debian/pool/non-free/d/doom-wad-shareware/doom-wad-shareware_1.9.fixed.orig.tar.gz && \
    tar -xzvf doom-wad-shareware.tar.gz -C /crispy-doom && \
    mv /crispy-doom/doom-wad-shareware-1.9.fixed/doom1.wad /crispy-doom && \
    rm -rf /crispy-doom/doom-wad-shareware-1.9.fixed && \
    rm doom-wad-shareware.tar.gz

ADD . /app

EXPOSE 8080