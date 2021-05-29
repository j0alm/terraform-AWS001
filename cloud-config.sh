#!/bin/bash -x

PORT=8080              # user to add or configure for
PASSWORD=Passw0rd       # password in case we add the user
DISPLAYMANAGER=lightdm  # lightdm or gdm3

SCRIPT_LOG_DETAIL=/var/log/cloud-config-detail.log

exec 3>&1 4>&2                  #
trap 'exec 2>&4 1>&3' 0 1 2 3   # https://serverfault.com/questions/103501/how-can-i-fully-log-all-bash-scripts-actions
exec 1>$SCRIPT_LOG_DETAIL 2>&1  #

apt-get update && apt-get -y upgrade && apt-get -y install apache2

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/001-default.conf

sed -i -e"s/:80/:$PORT/g" /etc/apache2/sites-available/001-default.conf
sed -i -e 's|/var/www/html|/var/www/html2/g' /etc/apache2/sites-available/001-default.conf



cat <<'EOF' > /tmp/ports.patch
--- ports.conf.original 2021-01-19 17:22:58.956154818 +0000
+++ ports.conf  2021-01-19 17:24:19.511930516 +0000
@@ -3,6 +3,7 @@
 # /etc/apache2/sites-enabled/000-default.conf

 Listen 80
+Listen SECOND_PORT

 <IfModule ssl_module>
        Listen 443
EOF

sed -i -e "s/SECOND_PORT/$PORT/g" /tmp/ports.patch

patch /etc/apache2/ports.conf < /tmp/ports.patch

cat <<'EOF' > /var/www/html/index.html
Welcome to our Apache server on port 80 !
EOF

mkdir /var/www/html2

cat <<'EOF' > /var/www/html2/index.html
Welcome to our Apache server on port 8080 !
EOF

a2ensite 001-default.conf

systemctl restart apache2
