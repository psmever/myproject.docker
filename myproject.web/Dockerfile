FROM ubuntu:latest
MAINTAINER psmever <psmever@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install --assume-yes apt-utils

RUN apt-get install  -y language-pack-ko

ENV OS_LOCALE="ko_KR.UTF-8"

RUN locale-gen ${OS_LOCALE}

ENV LANG=${OS_LOCALE}
ENV LANGUAGE=${OS_LOCALE}
ENV LC_ALL=${OS_LOCALE}

RUN localedef -f UTF-8 -i ko_KR ko_KR.utf8

# TimeZone 설정
RUN apt-get install  -y tzdata
ENV TZ="Asia/Seoul"
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN apt-get install -y net-tools
RUN apt-get install -y sendmail
# RUN apt-get install -y vim

ENV APACHE_CONF_DIR=/etc/apache2
ENV PHP_CONF_DIR=/etc/php/7.2
ENV PHP_DATA_DIR=/var/lib/php

RUN apt-get install -y apache2

RUN mv ${APACHE_CONF_DIR}/apache2.conf ${APACHE_CONF_DIR}/bak_apache2.conf
COPY ./apache2.conf ${APACHE_CONF_DIR}/apache2.conf

RUN mv ${APACHE_CONF_DIR}/sites-available/000-default.conf ${APACHE_CONF_DIR}/sites-available/bak_000-default.conf
COPY ./000-default.conf ${APACHE_CONF_DIR}/sites-available/000-default.conf

RUN mv ${APACHE_CONF_DIR}/ports.conf ${APACHE_CONF_DIR}/bak_ports.conf
COPY ./ports.conf ${APACHE_CONF_DIR}/ports.conf

RUN apt-get install -y \
    php \
    php-common \
    php-cli \
    libphp-embed \
    php-xdebug \
    php-bz2 \
    php-mbstring \
    php-zip \
    php-curl \
    php-xml \
    php-gd \
    php-mysql

RUN a2enmod rewrite headers
RUN a2enmod php7.2

RUN mkdir -p /var/www/myproject
RUN chown -R www-data:www-data /var/www/myproject

RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y iputils-ping
RUN apt-get install -y mariadb-client

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
EXPOSE 4040
EXPOSE 9000

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apac:q!he2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www


ADD ./send_mail.sh /usr/local/bin/send_mail.sh
ADD ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN /bin/bash /usr/local/bin/entrypoint.sh

RUN touch /var/log/xdebug.log

# CMD ["chown","-R www-data:www-data","/var/www/myproject/service/application/logs"]
# CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
