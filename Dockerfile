FROM alpine:3.7

ENV VERSION v1.6-rc5

WORKDIR /srv

RUN set -xe && \
    mkdir /config && \
    apk add --no-cache unzip curl ca-certificates && \
    curl -fsSLO --compressed "https://github.com/shawn1m/overture/releases/download/${VERSION}/overture-linux-amd64.zip" && \
    unzip -o "overture-linux-amd64.zip" -d /srv && \
    rm -rf "overture-linux-amd64.zip" && \
    cp /srv/config.json /config/ && \
    apk del unzip curl

VOLUME [ "/config" ]

CMD [ "/srv/overture-linux-amd64", "-c", "/config/config.json" ]
