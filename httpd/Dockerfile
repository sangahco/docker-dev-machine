FROM dev.sangah.com:5043/apache-base
#FROM dev.sangah.com:5043/apache-base-dev

MAINTAINER Emanuele Disco <emanuele.disco@gmail.com>

RUN apt-get update && apt-get -y install \
    libapache2-mod-php5 \
    php5-mysql \
    php5-sqlite \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY . /usr/local/src/
WORKDIR /usr/local/src

RUN set -xe \
    && cp -a conf/sites-available/. /etc/apache2/sites-available \
    # Add sites here
    && /usr/sbin/a2ensite default.conf \
    && /usr/sbin/a2ensite devnote.conf \
    && /usr/sbin/a2ensite pmis-manual.conf \
    && /usr/sbin/a2ensite others.conf \
    && /usr/sbin/a2ensite maven.conf \
    && /usr/sbin/a2ensite owncloud.conf \
    && cp docker-entrypoint.sh /entrypoint.sh \
    && rm -rf /usr/local/src

WORKDIR /var/www/html
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]