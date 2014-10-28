# CentOS Based HAProxy Container - Built On Version 6
FROM centos6:base
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Add Java Package To Build Image
ADD scripts/haproxy-marathon-bridge.sh /usr/bin/haproxy-marathon-bridge.sh
ADD scripts/run-haproxy-update.sh /usr/bin/run-haproxy-update.sh
ADD scripts/start.sh /start.sh

# Install Packages
RUN yum -y install haproxy && \
    yum -y clean all; \
    chmod u+x /usr/bin/haproxy-marathon-bridge; \
    chmod u+x /usr/bin/run-haproxy-update.sh; \
    chmod u+x /start.sh;

CMD ["/start.sh"]


