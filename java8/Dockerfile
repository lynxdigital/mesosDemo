# CentOS Based Java Container - Built On Version 6
FROM centos6:base
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Add Java Package To Build Image
ADD packages/jre-8u25-linux-x64.rpm /tmp/java-install.rpm

# Install Java Package And Reclaim Space
RUN yum -y install /tmp/java-install.rpm && \
    rm -f /tmp/java-install.rpm && \
    yum -y clean all;

