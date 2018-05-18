#!/bin/sh

#Ajouter la ligne suivante a la crontab :
#0 9 * * * ( date && sh /home/pi/gammu_and_raspisms/send_Anne_a_message.sh ) >> /home/pi/crontab_Anne_gammu_message.log 2>&1

usage () {
	echo "usage: ${0} <PHONE_NUMBER>"
	echo ""
	echo "There needs to have \"gammu-smsd\" installed"
	echo "and a file named \"gammu_message_Anne.txt\""
	echo "placed in a folder \"/home/pi/gammu_and_raspisms/\""
	echo "to work properly"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	sudo /etc/init.d/gammu-smsd stop
	cat /home/pi/GitHub_RaspberryPi/gammu_and_raspisms/gammu_message_Anne.txt | gammu --sendsms TEXT ${1} -len 2
	sudo /etc/init.d/gammu-smsd start
fi
