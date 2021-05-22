FROM centos:7
RUN yum update -y
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y yum-utils
RUN yum-config-manager --enable remi-php73
RUN yum install -y centos-release-scl httpd php73 php73-php php73-php-mbstring php73-php-mysqlnd php73-php-gd php73-php-xml
WORKDIR /var/www/html
COPY . .
RUN chown -R apache:apache /var/www/html
EXPOSE 80 443
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
