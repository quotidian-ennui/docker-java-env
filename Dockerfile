FROM maven:3.6.3-amazoncorretto-8

RUN yum -y update && \
    yum -y install ant wget unzip && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    mkdir /src

VOLUME /src
WORKDIR /src
