#!/bin/sh

usage () {
	echo "usage: ${0} <PROCESSUS_NAME>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	echo 'Le(s) processus suivant(s) correspond(ent) aux criteres :'
	ps aux | grep "PID\|${1}" | grep -v 'kill_process.sh\|grep'
	echo ''
	read -p 'Souhaitez-vous arreter ce(s) processus ? (Y/n) : ' VALUE
	if [ $VALUE = 'Y' ] ; then
		kill $(ps aux | grep "${1}" | grep -v 'kill_process.sh\|grep' | awk '{ print $2 }')
		echo 'Tache(s) arretee(s)'
	else
		echo 'Operation \"kill\" annulee'
	fi
fi
