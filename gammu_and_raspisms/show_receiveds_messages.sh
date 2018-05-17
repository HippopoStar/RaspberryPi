#!/bin/sh

#Ajouter la ligne suivante a la crontab :
#	* * * * * /home/pi/GitHub_RaspberryPi/gammu_and_raspisms/show_receiveds_messages.sh /var/www/html/RaspiSMS/receiveds/ > /dev/null 2>&1

#Dans son etat actuel, en plus de ne pas etre capable d'ouvrir une fenetre
#dans un 'tty' graphique depuis l'exterieur,
#le programme ne permet de traiter que le dernier SMS recu par a chaque
#intervalle de 1 minute

usage () {
	echo "usage: ${0} <RECEPTION_FOLDER_ENDED_BY_/>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	ls -l ${1} > /home/pi/sms_receiveds.witness.new
	sudo chmod a+w /home/pi/sms_receiveds.witness.new
	MESSAGE_ID=$(diff -N /home/pi/sms_receiveds.witness /home/pi/sms_receiveds.witness.new | tail -n 1 | awk '{ print $(NF) }')
	if [ 'x' != "x$MESSAGE_ID" ] ; then
		sh /home/pi/GitHub_RaspberryPi/scripts_shell/display_file_in_a_new_window.sh ${1}$MESSAGE_ID
		cp /home/pi/sms_receiveds.witness.new /home/pi/sms_receiveds.witness
		sudo chmod a+w /home/pi/sms_receiveds.witness
	fi
fi
