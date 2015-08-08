FROM alpine:3.2
MAINTAINER Andreas Linz <klingt.net@gmail.com>

RUN apk update &&\
    apk add curl \
            go \
            git

RUN rm -rf /var/cache/apk/*

# https://golang.org/doc/install/source#environment
ENV GOROOT  /usr/lib/go
ENV GOPATH  /opt/go
ENV GOBIN   $GOPATH/bin
ENV PATH    $PATH:$GOROOT/bin:$GOPATH/bin

RUN go get github.com/etsy/hound/cmds/...

## prebuild binary is not working
#ENV HOUND_VERSION "0.2.0"
#RUN curl -Ls "https://github.com/etsy/hound/releases/download/v${HOUND_VERSION}/houndd" > /usr/bin/houndd &&\
#    chmod +x /usr/bin/houndd

EXPOSE 6080

ENV HOUND_DATA /var/hound/data
ENV HOUND_CONF /etc/hound/conf.json
ADD ./hound_conf.json $HOUND_CONF

CMD houndd -conf $HOUND_CONF
