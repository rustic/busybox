FROM alpine:latest

RUN apk add --no-cache \
    busybox \
    && rm -rf /var/cache/apk/*

WORKDIR /busybox
ENTRYPOINT ["busybox"]