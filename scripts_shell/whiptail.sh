#!/bin/sh

usage () {
	echo "usage: ${0} <FILE>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	whiptail --title "${1}" --backtitle "whiptail - 'ATL'+'Q' OU 'ENTER' pour fermer la fenetre et revenir au terminal" --ok-button "D'acc'" --textbox ${1} 20 77
fi
