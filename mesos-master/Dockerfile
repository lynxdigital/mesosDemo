# Build Mesos And Marathon Container - Marathon Requires Java
FROM java:java8
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Download And Install Applications
RUN rpm -Uvh http://repos.mesosphere.io/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm && \
    cd /tmp && \
    curl -O http://downloads.mesosphere.com/marathon/v0.7.1/marathon-0.7.1.tgz && \
    yum -y install mesos tar && \
    tar zxf /tmp/marathon-0.7.1.tgz -C /usr/local && \
    mv /usr/local/marathon-0.7.1 /usr/local/marathon && \
    rm -f /tmp/marathon-0.7.1.tgz && \
    yum -y clean all;

# Add Run Script
ADD scripts/start.sh /start.sh

# Set Run Script Permissions
RUN chmod u+x /start.sh;

# Expose Ports
EXPOSE 5050/tcp 8080/tcp

# Set Start Script As Default
CMD ["/start.sh"]
