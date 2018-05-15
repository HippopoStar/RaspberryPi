#!/bin/sh

usage () {
	echo "usage: ${0} <PROCESSUS_NAME>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	echo "Le(s) processus suivant(s) correspond(ent) aux criteres :"
	ps aux | grep "PID\|${1}" | grep -v "kill_process.sh\|grep"
	echo ""
	read -p "Arreter ce(s) processus ? (Y/n) : " VALUE
#	kill $(ps aux | grep "${1}" | grep -v "kill_process.sh\|grep" | awk '{ print $2 }')
fi
