FROM centos:7
FROM python:2.7
FROM java:openjdk-8-jdk
MAINTAINER Alex Unwin <aunwin90@gmail.com>

#  Version
ENV SOAPUI_VERSION  5.5.0
ENV MYSQL_CONNECTOR_VERSION 5.1.48

# Download and unarchive SoapUI
RUN mkdir -p /opt &&\
    curl  https://s3.amazonaws.com/downloads.eviware/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.tar.gz -O /tmp/mysql-connector.tar.gz \
    && tar -xvzf /tmp/mysql-connector.tar.gz \
    && cp mysql-connector-java-${MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}-bin.jar /opt/SoapUI/bin/ext

# Set working directory
WORKDIR /opt/bin

# Set environment
ENV PATH ${PATH}:/opt/SoapUI/bin