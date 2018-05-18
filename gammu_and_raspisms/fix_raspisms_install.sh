#!/bin/sh

sudo chown -R gammu:gammu /var/www/html/RaspiSMS/receiveds

sudo mv /var/www/html/RaspiSMS/receiveds/.to-keep /var/www/html/RaspiSMS/

sudo sed -i 's/\/var\/www\/RaspiSMS\/receiveds\//\/var\/www\/html\/RaspiSMS\/receiveds\//g' /var/www/html/RaspiSMS/parseSMS.sh

