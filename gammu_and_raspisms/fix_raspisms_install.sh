#!/bin/sh

sudo chown -R gammu:gammu /var/www/html/RaspiSMS/receiveds

sudo sed -i 's/\/var\/www\/RaspiSMS\/receiveds\//\/var\/www\/html\/RaspiSMS\/receiveds\//g' /var/www/html/RaspiSMS/parseSMS.sh

