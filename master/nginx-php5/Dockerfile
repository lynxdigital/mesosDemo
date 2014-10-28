# Simple Nginx PHP Base - Built On CentOS 6
FROM centos6:base
MAINTAINER Geoffrey Harrison <geoffrey.harrison@lynxdigital.com.au>

ADD scripts/start.sh /start.sh

# Install And COnfigure PHP and Nginx
RUN yum -y install epel-release && \
	yum -y install nginx php-fpm && \
    yum -y clean all; \
    sed -i "s/user\ =\ apache/user\ =\ nginx/g" /etc/php-fpm.d/www.conf; \
	sed -i "s/group\ =\ apache/group\ =\ nginx/g" /etc/php-fpm.d/www.conf; \
	echo "daemon off;" >> /etc/nginx/nginx.conf; \
	rm -f /etc/nginx/conf.d/ssl.conf; \
	rm -f /etc/nginx/conf.d/virtual.conf; \
	chmod u+x start.sh;

EXPOSE 80/tcp 443/tcp

CMD ["/start.sh"]

