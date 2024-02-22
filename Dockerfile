FROM alpine

ENV HUGO_VERSION 0.123.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
ENV DL_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}

RUN apk update \
    && apk add wget libc-dev ca-certificates git tar \
    && rm -rf /var/cache/apk/* 

ADD ${DL_URL} /tmp
RUN tar xzvf /tmp/${HUGO_BINARY} \
    && mv hugo /usr/local/bin/hugo \
    && chmod +x /usr/local/bin/hugo \
	&& rm -fr /tmp/${HUGO_BINARY} 

ENTRYPOINT [ "" ]
CMD [ "/usr/local/bin/hugo" ]

