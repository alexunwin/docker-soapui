FROM centos:7
FROM python:2.7
FROM java:openjdk-8-jdk
MAINTAINER Alex Unwin <aunwin90@gmail.com>

#  Version
ENV   SOAPUI_VERSION  5.5.0

# Download and unarchive SoapUI
RUN mkdir -p /opt &&\
    curl  https://s3.amazonaws.com/downloads.eviware/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

# Set working directory
WORKDIR /opt/bin

# Set environment
ENV PATH ${PATH}:/opt/SoapUI/bin

ENTRYPOINT ["/opt/SoapUI/bin"]