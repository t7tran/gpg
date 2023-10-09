FROM alpine:3.18

RUN apk add --no-cache gpg gpg-agent && \
    addgroup -g 1000 alpine && adduser -u 1000 -s /bin/sh -D -G alpine alpine

USER alpine

ENTRYPOINT ["gpg"]
CMD ["--version"]
