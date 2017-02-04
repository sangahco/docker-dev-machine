FROM dev.sangah.com:5043/apache-base
MAINTAINER Emanuele Disco <emanuele.disco@gmail.com>

COPY . /setup

RUN set -xe \
    && cp -v /setup/conf/conf-available/* /etc/apache2/conf-available \
    && cp -v /setup/conf/sites-available/* /etc/apache2/sites-available \
    && cp -v /setup/conf/workers.properties /etc/libapache2-mod-jk \

    # ENABLE SITES
    && /usr/sbin/a2ensite devnote.conf \
    && /usr/sbin/a2ensite stnd-pmis.conf \
    && /usr/sbin/a2ensite pmis-manual.conf \
    && /usr/sbin/a2enconf maven.conf \
    && /usr/sbin/a2enconf owncloud.conf \

    # ENABLE CONFIGURATIONS
    && /usr/sbin/a2enconf ssl.conf \

    # FINAL SETTINGS
    && cp /setup/docker-entrypoint.sh /entrypoint.sh \
    && rm -rf /setup

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]