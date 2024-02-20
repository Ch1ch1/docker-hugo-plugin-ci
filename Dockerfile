FROM debian

ENV HUGO_VERSION 0.123.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
ENV DL_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}

RUN apt-get update && apt-get install -y wget libc6-dev ca-certificates git \
    && apt-get clean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ \
    && wget ${DL_URL} \
    && tar xzf ${HUGO_BINARY} \
    && rm -r ${HUGO_BINARY} \
    && mv hugo /usr/bin 

ADD drone-hugo.sh /bin/
RUN chmod +x /bin/drone-hugo.sh

ENTRYPOINT /bin/drone-hugo.sh
