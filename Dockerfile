FROM alpine:3.19

RUN apk add --no-cache shadowsocks-libev

ENV SSPASSWORD=123456
ENV PORT=8388

EXPOSE $PORT

CMD ss-server -p $PORT -k $SSPASSWORD -m aes-256-gcm
