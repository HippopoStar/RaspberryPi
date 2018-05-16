#!/bin/sh

usage () {
	echo "usage: ${0} <FILE>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	echo "Combinaison de touches 'ALT'+'F4' pour fermer la fenetre au clavier"
	xmessage -button 'Message recu':0 -print -center -geometry 360x240 "$(cat ${1})"
fi
