FROM alpine:3.19

RUN apk add --no-cache shadowsocks-libev

ENV SSPASSWORD=123456
ENV SSPORT=8388

EXPOSE $SSPORT

CMD ss-server -p $SSPORT -k $SSPASSWORD -m aes-256-gcm
