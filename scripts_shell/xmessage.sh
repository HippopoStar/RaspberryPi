#!/bin/sh

usage () {
	echo "usage: ${0} <FILE>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	HOW_TO_LEAVE="'ALT'+'F4' pour fermer la fenetre au clavier"
	echo "$HOW_TO_LEAVE"
	xmessage -title "$HOW_TO_LEAVE" -button 'Message recu !':0 -print -center -geometry 720x360 -file ${1}
fi
