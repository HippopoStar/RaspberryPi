#!/bin/sh

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
