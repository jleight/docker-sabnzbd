#!/bin/sh

if [ ! -f "${APP_CONFIG}/sabnzbd.ini" ]; then
  cat <<EOF > "${APP_CONFIG}/sabnzbd.ini"
[misc]
host = 0.0.0.0
download_dir = ${APP_DATA}/incomplete
complete_dir = ${APP_DATA}/complete
EOF
  chown sabnzbd:sabnzbd "${APP_CONFIG}/sabnzbd.ini"
fi

exec /sbin/setuser sabnzbd \
  /usr/bin/python2.7 "${APP_HOME}/SABnzbd.py" \
  -f "${APP_CONFIG}"
