FROM centos:7

ENV NAGIOS_API_HOST=host.docker.internal
ENV NAGIOS_API_PORT=6315
ENV NAGIOS_API_WEBURL='https:\/\/nagios.company.tld\/nagios'
MAINTAINER Alex White (alex.white@diamond.ac.uk)

RUN yum -y install httpd php git

# set up container
COPY container/index.php /var/www/html/
COPY container/timezone.ini /etc/php.d/

# install Nagdash
COPY htdocs/ /var/www/html/Nagdash/htdocs/
COPY images/ /var/www/html/Nagdash/images/
COPY phplib/ /var/www/html/Nagdash/phplib/
COPY LICENSE /var/www/html/Nagdash/

# config Nagdash via a template which gets populated by run.sh
COPY container/config.php.template /var/www/html/Nagdash/
COPY container/run.sh /

EXPOSE 80/tcp
CMD /run.sh
