#!/bin/sh

#Ajouter la ligne suivante a la crontab :
#	* * * * * /home/pi/GitHub_RaspberryPi/gammu_and_raspisms/write_receiveds_messages_on_tty2.sh /var/www/html/RaspiSMS/receiveds/ > /dev/null 2>&1

#Il est necessaire que l'utilisateur 'pi' se soit logge sur le terminal tty2
#pour permettre le bon fonctionnement de ce programme
#le programme ne permet de traiter que le dernier SMS recu par a chaque
#intervalle de 1 minute

usage () {
	echo "usage: ${0} <RECEPTION_FOLDER_ENDED_BY_/>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	ls -l /var/www/html/RaspiSMS/receiveds/ > /home/pi/sms_receiveds.witness.new
	MESSAGE_ID=$(diff -N /home/pi/sms_receiveds.witness /home/pi/sms_receiveds.witness.new | tail -n 1 | awk '{ print $(NF) }')
	if [ 'x' != "x$MESSAGE_ID" ] ; then
		cat ${1}$MESSAGE_ID | sudo write pi tty2
		cp /home/pi/sms_receiveds.witness.new /home/pi/sms_receiveds.witness
	fi
fi
