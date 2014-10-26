# Build Private Docker Container Registry - From CentOS 6 Base
FROM centos6:base
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lyxndigital.com.au>

# Add The Startup Script
ADD scripts/start.sh /start.sh

# Install Packages And Set Start Scripts Permissions
RUN yum -y install epel-release && \
    yum -y install docker-registry && \
    yum -y clean all;\
    chmod u+x /start.sh

# Expose Volumes And Ports
VOLUME ["/var/lib/docker-registry"]
EXPOSE 5000/tcp

# Define Default Start Command (CMD not ENTRYPOINT)
CMD ["/start.sh"]
