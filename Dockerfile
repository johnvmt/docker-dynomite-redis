FROM alpine:latest AS builder

MAINTAINER "John Murphy" <johnvmt@gmail.com>

RUN apk update \
    && apk upgrade \
    && apk add --no-cache make bash libltdl libtool git autoconf automake openssl-dev gcc libc-dev

WORKDIR /

RUN git clone https://github.com/Netflix/dynomite.git

WORKDIR /dynomite

RUN autoreconf -fvi \
	&& ./configure \
	&& make \
	&& make install

FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache redis

WORKDIR /dynomite

COPY --from=builder /dynomite/src ./src

COPY dynomite/ .

RUN chmod +x startup.sh

EXPOSE 8101

EXPOSE 8102

EXPOSE 22122

EXPOSE 22222

ENTRYPOINT ["/dynomite/startup.sh"]