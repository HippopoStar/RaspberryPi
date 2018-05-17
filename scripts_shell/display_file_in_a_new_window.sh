#!/bin/sh

usage () {
	echo "usage: ${0} <ABSOLUTE_PATH_TO_FILE>"
}

if [ ${#} -ne 1 ] ; then
	usage
else
	x-terminal-emulator -t '(~.-)' -e bash -c "cat ${1} && bash"
fi
