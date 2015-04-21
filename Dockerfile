FROM jleight/phusion-python:2.7
MAINTAINER Jonathon Leight <jonathon.leight@jleight.com>

RUN set -x \
  && echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' \
    >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y \
    python-cheetah \
    python-configobj \
    python-feedparser \
    python-dbus \
    python-openssl \
    python-support \
    python-yenc \
    par2 \
    unrar \
    unzip \
    p7zip-full \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

ENV APP_HOME    /opt/sabnzbd
ENV APP_CONFIG  /etc/opt/sabnzbd
ENV APP_DATA    /var/opt/sabnzbd
ENV APP_VERSION 0.7.20
ENV APP_BASEURL https://github.com/sabnzbd/sabnzbd/archive
ENV APP_PKGNAME ${APP_VERSION}.tar.gz
ENV APP_URL     ${APP_BASEURL}/${APP_PKGNAME}

RUN set -x \
  && groupadd -r -g 300 sabnzbd \
  && useradd -r -u 300 -g sabnzbd sabnzbd \
  && mkdir -p "${APP_HOME}" "${APP_CONFIG}" "${APP_DATA}" \
  && chown sabnzbd:sabnzbd "${APP_CONFIG}" "${APP_DATA}" \
  && curl -kL "${APP_URL}" | tar -xz -C "${APP_HOME}" --strip-components=1 \
  && chown -R sabnzbd:sabnzbd "${APP_HOME}"

ADD sabnzbd-service.sh /etc/service/sabnzbd/run

EXPOSE 8080
VOLUME ["/etc/opt/sabnzbd", "/var/opt/sabnzbd"]
