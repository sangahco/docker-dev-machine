FROM debian:jessie
MAINTAINER Emanuele Disco <emanuele.disco@gmail.com>

RUN apt-get update && apt-get -y install \
    apache2 \
    php5 \
    php5-mysql \
    libapache2-mod-jk \
    libapache2-mod-php5 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

COPY . /setup

RUN set -xe \
    && cp /setup/conf/httpd.conf /etc/apache2/apache2.conf \
    && cp /setup/conf/conf-available/* /etc/apache2/conf-available \
    && cp /setup/conf/sites-available/* /etc/apache2/sites-available \
    && cp /setup/conf/workers.properties /etc/libapache2-mod-jk \

    # ENABLE MODS
    && /usr/sbin/a2enmod ssl \
    && /usr/sbin/a2enmod rewrite \
    && /usr/sbin/a2enmod proxy \
    && /usr/sbin/a2enmod proxy_http \

    # ENABLE SITES
    && /usr/sbin/a2ensite devnote.conf \
    && /usr/sbin/a2ensite stnd-pmis.conf \
    && /usr/sbin/a2ensite pmis-manual.conf \
    && /usr/sbin/a2ensite maven.conf \
    && /usr/sbin/a2ensite mysqladmin.conf \

    # ENABLE CONFIGURATIONS
    && /usr/sbin/a2enconf ssl.conf \
    #&& /usr/sbin/a2enconf jk.conf \

    # FINAL SETTINGS
    && cp /setup/docker-entrypoint.sh /entrypoint.sh \
    && ln -s /var/log/apache2 /etc/apache2/logs \
    && rm -rf /setup

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]