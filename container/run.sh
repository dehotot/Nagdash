#!/bin/bash

# create the config file from template
sed "s/%NAGIOS_API_HOST%/${NAGIOS_API_HOST}/g; s/%NAGIOS_API_PORT%/${NAGIOS_API_PORT}/g; s/%NAGIOS_API_WEBURL%/${NAGIOS_API_WEBURL}/g; s/%NAGDASH_REFRESH_PERIOD%/${NAGDASH_REFRESH_PERIOD}/g;" /var/www/html/Nagdash/config.php.template \
	> /var/www/html/Nagdash/config.php

echo '== Nagdash Config ============================================================'
cat /var/www/html/Nagdash/config.php
echo ''
echo '=============================================================================='
echo ''

# start the webserver
touch /var/log/httpd/access_log /var/log/httpd/error_log
httpd
tail -f /var/log/httpd/access_log >> /dev/stdout &
tail -f /var/log/httpd/error_log >> /dev/stderr
