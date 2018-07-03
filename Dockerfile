FROM alpine:3.7

ENV VERSION 1.3.6.2

RUN set -xe && \
    mkdir /config && \
    apk add --no-cache unzip curl && \
    curl -fsSLO --compressed "https://github.com/shawn1m/overture/releases/download/${VERSION}/overture-linux-amd64.zip" && \
    unzip -o "overture-linux-amd64.zip" -d /config && \
    rm -rf "overture-linux-amd64.zip" && \
    mv /config/overture-linux-amd64 /usr/bin/overture && \
    apk del unzip curl

VOLUME [ "/config/" ]

CMD [ "/usr/bin/overture", "-c", "/config/config.json" ]