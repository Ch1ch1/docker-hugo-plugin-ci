FROM alpine:3.17

ENV HUGO_VERSION 0.111.3
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
ENV DL_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}


RUN apk update && \
    apk add --no-cache wget gcompat ca-certificates libc6-compat libstdc++ git

RUN wget ${DL_URL} && \
  tar xzf ${HUGO_BINARY} && \
  rm -r ${HUGO_BINARY} && \
  mv hugo /usr/bin && \
  rm /var/cache/apk/*

ADD drone-hugo.sh /bin/
RUN chmod +x /bin/drone-hugo.sh

ENTRYPOINT /bin/drone-hugo.sh
