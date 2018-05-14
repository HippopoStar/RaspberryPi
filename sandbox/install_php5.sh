#!/bin/sh

sudo echo "" >> /etc/apt/sources.list
sudo echo "deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi" >> /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get -y install php5 php5-curl php5-cli php5-mysql php5-gd
sudo update-alternatives --set php /usr/bin/php5
