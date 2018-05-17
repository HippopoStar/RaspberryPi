#!/bin/sh

#Ajouter la ligne suivante a la crontab :
#	* * * * * /home/pi/GitHub_RaspberryPi/gammu_and_raspisms/write_receiveds_messages_on_tty2.sh /var/www/html/RaspiSMS/receiveds/ > /dev/null 2>&1

#Il est necessaire que l'utilisateur 'pi' se soit logge sur le terminal tty2
#pour permettre le bon fonctionnement de ce programme
#le programme ne permet de traiter que le dernier SMS recu par a chaque
#intervalle de 1 minute

usage () {
	echo "usage: ${0} <RECEPTION_FOLDER_ENDED_BY_/>"
	echo 'Without any given argument, programm will be launched'
	echo 'with default argument /var/www/html/RaspiSMS/receiveds/'
}

#La fonction 'is_a_directory ()' renvoie 1 en l'absence de parametre
#ou si l'argument passe en parametre et un repertoire termine par '/'
is_a_directory () {
	if test $# -ge 1 && ( test ! -d $1 || test "x`echo "$1" | awk '{ print /\/$/ }'`" != 'x1' ) ; then
		echo '0'
	else
		echo '1'
	fi
}

LS_OPTIONS='--format=long --almost-all --group-directories-first --color=never --indicator-style=slash --sort=time --reverse'

WITNESS_PATH='/home/pi/sms_receiveds.witness'

if [ ${#} -gt 1 ] || [ `is_a_directory ${1}` != '1' ] ; then
	usage
else
	if [ ${#} -eq 1 ] ; then
		DIRECTORY="${1}"
	else
		DIRECTORY=/var/www/html/RaspiSMS/receiveds/
	fi
	ls $LS_OPTIONS $DIRECTORY > $WITNESS_PATH.new
	sudo chmod a+w $WITNESS_PATH.new
	MESSAGE_ID=$(diff -N $WITNESS_PATH $WITNESS_PATH.new | tail -n 1 | awk '{ print $(NF) }')
	if [ 'x' != "x$MESSAGE_ID" ] ; then
		cat $DIRECTORY$MESSAGE_ID | sudo write pi tty2
		cp $WITNESS_PATH.new $WITNESS_PATH
		sudo chmod a+w $WITNESS_PATH
	fi
fi
