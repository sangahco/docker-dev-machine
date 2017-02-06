FROM dev.sangah.com:5043/apache-pmis
MAINTAINER Emanuele Disco <emanuele.disco@gmail.com>

COPY . /setup

RUN set -xe \
    && cp -v /setup/conf/conf-available/* /etc/apache2/conf-available \
    && cp -v /setup/conf/sites-available/* /etc/apache2/sites-available \
    && /usr/sbin/a2ensite devnote.conf \
    && /usr/sbin/a2ensite pmis-manual.conf \
    && /usr/sbin/a2enconf maven.conf \
    && /usr/sbin/a2enconf owncloud.conf \
    && rm -rf /setup