FROM alpine

ENV HUGO_VERSION 0.123.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
ENV DL_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}

RUN apk update \
    && apk add wget libc-dev ca-certificates git tar \
    && rm -rf /var/cache/apk/* 

ADD ${DL_URL} /tmp
RUN tar xzvf /tmp/${HUGO_BINARY} -C /usr/local/bin \
	&& rm -fr /tmp/${HUGO_BINARY}

ADD drone-hugo.sh /bin/
RUN chmod +x /bin/drone-hugo.sh \
    && chmod +x /usr/local/bin/hugo

ENTRYPOINT /bin/drone-hugo.sh

