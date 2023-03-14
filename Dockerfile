FROM alpine:3.17

RUN apk add --no-cache \
    ca-certificates \
    mailcap \
    git \
    wget \
    libc6-compat \
    libstdc++ \
    musl-dev

ADD drone-hugo.sh /bin/
RUN chmod +x /bin/drone-hugo.sh

ENTRYPOINT /bin/drone-hugo.sh
