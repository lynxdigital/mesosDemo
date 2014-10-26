# Build Mesos Slave Container - Requires Java
FROM centos6:java8
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Add Run Script
ADD scripts/start.sh /start.sh

# Download And Install Mesos - Set Startup Permissions
RUN rpm -Uvh http://repos.mesosphere.io/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm && \
    yum -y install mesos tar && \
    yum -y clean all; \
	chmod u+x /start.sh;

# Set Start Script As Default
CMD ["/start.sh"]
