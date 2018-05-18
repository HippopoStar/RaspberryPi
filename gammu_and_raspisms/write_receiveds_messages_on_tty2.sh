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
#ou si l'argument passe en parametre est un repertoire termine par '/'
is_a_directory () {
	if test ${#} -ge 1 && ( test ! -d ${1} || test "x`echo "${1}" | awk '{ print /\/$/ }'`" != 'x1' ) ; then
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
	if test "`ls ${LS_OPTIONS} ${DIRECTORY} | awk 'END { print $0 }'`" != "`cat ${WITNESS_PATH} | awk 'END { print $0 }'`" ; then
		ls ${LS_OPTIONS} ${DIRECTORY} > ${WITNESS_PATH}.new
		sudo chmod a+w ${WITNESS_PATH}.new
		CURRENT_LINE=6	#car avec la commande ls -l, la premiere ligne
				#correspond a la somme des poids des fichiers
				#du dossier, valeur qui est alteree a l'ajout
				#d'un fichier
		TOTAL_LINES=`diff -N ${WITNESS_PATH} ${WITNESS_PATH}.new | wc -l`
		while [ ${CURRENT_LINE} -le ${TOTAL_LINES} ] ; do
			MESSAGE_ID=`diff -N ${WITNESS_PATH} ${WITNESS_PATH}.new | awk -v LINE=${CURRENT_LINE} 'NR == LINE { print $NF }'`
			MAY_ERROR=`cat ${DIRECTORY}${MESSAGE_ID} | sudo write pi tty2 2>&1 | awk 'NR == 1 { print $0 }'`
			#Une variable fait l'affaire pour assumer le role
			#de MAY_ERROR, car le message d'erreur
			#(a savoir "write: pi is not logged in on tty2")
			#ne depasse pas une ligne
			CURRENT_LINE=$((${CURRENT_LINE} + 1))
		done
		if test 'x' = "x${MAY_ERROR}" ; then
			cp ${WITNESS_PATH}.new ${WITNESS_PATH}
			sudo chmod a+w ${WITNESS_PATH}
		fi
	fi
fi
