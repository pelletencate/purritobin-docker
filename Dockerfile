FROM alpine:latest AS build
RUN apk add --no-cache libstdc++
RUN apk add --no-cache --virtual build-deps curl patch g++ zlib-dev openssl-dev pkgconfig make && \
    mkdir /build && cd /build && \
    curl https://codeload.github.com/uNetworking/uSockets/tar.gz/master | tar xz && cd uSockets-master && \
    curl 'https://aur.archlinux.org/cgit/aur.git/plain/usockets-0.6.0-Makefile.patch?h=usockets' | patch -p1 && \
    make WITH_OPENSSL=1 default && make install && cd .. && \
    \
    curl https://codeload.github.com/uNetworking/uWebSockets/tar.gz/v18.23.0 | tar xz && cd uWebSockets-18.23.0 && \
    make install && cd .. && \
    \
    curl https://codeload.github.com/PurritoBin/PurritoBin/tar.gz/0.4.0 | tar xz && \
    cd PurritoBin-0.4.0 && make && make install && cd / && \
    \
    apk del build-deps && rm -rf /build
