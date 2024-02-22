FROM alpine

ENV HUGO_VERSION 0.123.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
ENV DL_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}

RUN apk update \
    && apk add wget libc-dev ca-certificates opendoas git wget tar \
    && rm -rf /var/cache/apk/*
RUN doas apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

ADD drone-hugo.sh /bin/
RUN chmod +x /bin/drone-hugo.sh 

ENTRYPOINT /bin/drone-hugo.sh

