#!/bin/sh

usage () {
	echo "usage: ${0} <WHERE> <WHAT>"
}

if [ ${#} -ne 2 ] ; then
	usage
else
	sudo find ${1} \( -type d -o -type f \) -name "*${2}*" -printf "\n%y %p"
	echo ""
fi
