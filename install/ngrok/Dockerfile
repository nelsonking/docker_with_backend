FROM golang:1.7.1-alpine
ADD build.sh /
RUN apk add --no-cache git make openssl
RUN git clone https://github.com/inconshreveable/ngrok.git --depth=1 /ngrok
RUN sh /build.sh
EXPOSE 8081
VOLUME [ "/ngrok" ]
CMD [ "/ngrok/bin/ngrokd"]
