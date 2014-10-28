# Build Apache ZooKeeper Container - From Centos6/Java8 Container
FROM centos6:java8
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

# Add Startup Script And Packages
ADD scripts/start.sh /start.sh
ADD packages/bigtop-utils-0.6.0+243-1.cdh4.7.0.p0.17.el6.noarch.rpm /tmp/bigtop-utils-0.6.0+243-1.cdh4.7.0.p0.17.el6.noarch.rpm
ADD packages/zookeeper-3.4.5+26-1.cdh4.7.0.p0.17.el6.x86_64.rpm /tmp/zookeeper-3.4.5+26-1.cdh4.7.0.p0.17.el6.x86_64.rpm

# Install Additional Packages - Set Start Script Permissions - Clean Out Files
RUN yum -y install /tmp/zookeeper-3.4.5+26-1.cdh4.7.0.p0.17.el6.x86_64.rpm /tmp/bigtop-utils-0.6.0+243-1.cdh4.7.0.p0.17.el6.noarch.rpm && \
      yum -y clean all && \
      rm -f zookeeper-3.4.5+26-1.cdh4.7.0.p0.17.el6.x86_64.rpm bigtop-utils-0.6.0+243-1.cdh4.7.0.p0.17.el6.noarch.rpm; \
      chmod u+x /start.sh;

# Expose Volumes And Ports
#EXPOSE 2888/tcp 3888/tcp
EXPOSE 2181/tcp

# Define Startup Script
CMD ["/start.sh"]
