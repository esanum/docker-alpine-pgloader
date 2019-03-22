# docker-alpine-pgloader

This image builds pgloader on `alpine:3.9` into `/opt/src/pgloader/build/bin/pgloader`.
If you want to use `pgloader` in your own image you can `COPY` it with multi-step
builds like this:

```dockerfile
FROM esanumeventapp/alpine-pgloader:latest as builder

FROM debian:stable-slim

# Runtime dependencies for pgloader
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      curl \
      freetds-dev \
      gawk \
      libsqlite3-dev \
      libzip-dev \
      make \
      sbcl \
      unzip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /opt/src/pgloader/build/bin/pgloader /usr/local/bin
```
