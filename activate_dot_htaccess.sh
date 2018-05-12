#!/bin/sh

sudo sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf
cat /etc/apache2/apache2.conf
sudo /ect/init.d/apache2 restart
