# Build Mesos Master Container From Mesos Base  - Added Marathon And Config
FROM mesos:base
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Copy In Local Marathon Package
ADD packages/marathon-0.7.1.tgz /tmp/marathon

# Add Run Script
ADD scripts/start.sh /start.sh

# Download And Install Applications
RUN cd /tmp && \
      mv /tmp/marathon/marathon-0.7.1 /usr/local/marathon && \
      rm -rf /tmp/marathon; \
	    chmod u+x /start.sh;

# Expose Ports
EXPOSE 5050/tcp 8080/tcp

# Set Start Script As Default
CMD ["/start.sh"]
