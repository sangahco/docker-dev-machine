FROM owncloud/server:9.1
LABEL maintainer="Emanuele Disco <emanuele.disco@gmail.com>"

RUN set -e && \
  apt-get update && apt-get -y install \
    gettext-base \
    fontconfig \
    locales \
    nano \
    sudo && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  fc-cache -fv && \
  sed -i -e 's/# ko_KR.UTF-8 UTF-8/ko_KR.UTF-8 UTF-8/' /etc/locale.gen && \
  echo 'LANG="ko_KR.UTF-8"'>/etc/default/locale && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=ko_KR.UTF-8

ENV LC_ALL=ko_KR.UTF8

# we copy the themes folder into owncloud image
COPY ./themes /var/www/owncloud/themes