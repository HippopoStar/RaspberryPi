#!/bin/sh

#S'assurer d'avoir au prealable branche son dongle 3G au RaspberryPi

sudo apt-get update -y
sudo apt-get upgrade -y
sudo mkdir -p /home/pi/RaspiSMS
sudo wget -P /home/pi/RaspiSMS/ -O raspisms.deb http://raspisms.raspbian-france.fr/download/raspisms-2.0.1.deb
cd /home/pi/RaspiSMS
sudo aptitude install apache2 php php-mysql php-mbstring gammu gammu-smsd mysql-server
sudo dpkg -i /home/pi/RaspiSMS/raspisms.deb
sudo aptitude install raspisms
