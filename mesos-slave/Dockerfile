# Build Mesos Slave Container - Requires Java
FROM mesos:base
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Add Run Script
ADD scripts/start.sh /start.sh

# Add EPEL Package Repo - Install Docker Binaries
RUN yum -y install epel-release && \
	yum -y install docker-io && \
	yum clean all; \
	chmod u+x /start.sh;

# Set Start Script As Default
CMD ["/start.sh"]
