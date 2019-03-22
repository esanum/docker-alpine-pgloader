FROM alpine:3.9

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
      apk add --update --no-cache bzip2 curl freetds-dev gawk git sqlite-dev libzip-dev make patch sbcl@testing unzip wget

RUN git clone https://github.com/dimitri/pgloader.git /opt/src/pgloader

RUN mkdir -p /opt/src/pgloader/build/bin \
    && cd /opt/src/pgloader \
    && make
