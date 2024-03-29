FROM debian:stable-slim

ENV HUGO_VERSION 0.123.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
ENV DL_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    libc-dev \
    ca-certificates \
    git \
    tar \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD ${DL_URL} /tmp
ADD drone-hugo.sh /bin
RUN tar xzvf /tmp/${HUGO_BINARY} \
    && mv hugo /usr/local/bin/hugo \
    && chmod +x /bin/drone-hugo.sh

ENTRYPOINT [ "/bin/drone-hugo.sh" ]


