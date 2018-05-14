#!/bin/sh

#Ajouter la ligne suivante au fichier /etc/rc.local :
#	/home/pi/GitHub_RaspberryPi/gammu_and_raspisms/reboot_notification.sh <PHONE_NUMBER> > /home/pi/reboot_notification.log 2>&1

usage () {
	echo "usage: ${0} <PHONE_NUMBER>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	sudo /etc/init.d/gammu-smsd stop
	gammu entersecuritycode PIN 1234
	gammu --sendsms TEXT ${1} -text "RaspberryPi Reboot Successful"
	sudo /etc/init.d/gammu-smsd start
fi
