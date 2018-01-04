FROM maven:3.5.2-alpine

RUN apk add --no-cache --update apache-ant bash wget unzip && \
    mkdir /src

VOLUME /src
WORKDIR /src
