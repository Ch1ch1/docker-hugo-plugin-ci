FROM debian:stable-slim

ENV HUGO_VERSION 0.123.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
ENV DL_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}

RUN apt update \
    && apt install -y wget libc-dev ca-certificates git tar \
    && rm -rf /var/lib/apt/lists/*```

ADD ${DL_URL} /tmp
RUN tar xzvf /tmp/${HUGO_BINARY}
RUN mv hugo /usr/local/bin/hugo \
    && chmod +x /usr/local/bin/hugo

ENTRYPOINT [ "" ]
CMD [ "hugo" ]

