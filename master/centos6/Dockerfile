# CentOS 6 Base Container - Built From Scratch
FROM scratch
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Add Base OS To Container Image
ADD packages/CentOS-6-20140926_1219-docker.tar.xz /

# Set Any Perminant Environment Variables For Container
#ENV http_proxy
#ENV https_proxy

# Update Packages To The Latest Version - Clean Out Extra Files
RUN yum -y update;\
      yum clean all;

