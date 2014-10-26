# Build Mesos And Marathon Container - Marathon Requires Java
FROM centos6:java8
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Copy In Local Marathon Package
ADD packages/marathon-0.7.1.tgz /tmp/marathon

# Download And Install Applications
RUN rpm -Uvh http://repos.mesosphere.io/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm && \
    cd /tmp && \
    yum -y install mesos tar && \
    mv /tmp/marathon/marathon-0.7.1 /usr/local/marathon && \
    rm -rf /tmp/marathon && \
    yum -y clean all;

# Add Run Script
ADD scripts/start.sh /start.sh

# Set Run Script Permissions
RUN chmod u+x /start.sh;

# Expose Ports
EXPOSE 5050/tcp 8080/tcp

# Set Start Script As Default
CMD ["/start.sh"]
