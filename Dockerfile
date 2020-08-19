FROM maven:3.6.1-jdk-8-alpine

RUN apk add --no-cache --update apache-ant bash wget unzip && \
    mkdir /src

VOLUME /src
WORKDIR /src
