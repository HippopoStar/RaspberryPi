#!/bin/sh

usage () {
	echo "usage: ${0} <FILE>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	lxterminal -t ${1} -e bash -c "cat ${1} && bash"
fi
