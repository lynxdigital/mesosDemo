# Build Apache ZooKeeper Container - From Centos6/Java8 Container
FROM centos6:java8
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Add Startup Script
ADD scripts/start.sh /start.sh

# Install Additional Packages - Set Start Script Permissions - Clean Out Files
RUN rpm -Uvh http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm && \
    yum -y install zookeeper && \
    yum -y clean all;\
    chmod u+x /start.sh;

# Expose Volumes And Ports
#EXPOSE 2888/tcp 3888/tcp

# Define Startup Script
CMD ["/start.sh"]
