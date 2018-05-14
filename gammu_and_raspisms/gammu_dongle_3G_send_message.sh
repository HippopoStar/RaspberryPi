#!/bin/sh

usage () {
	echo "usage: ${0} <PHONE_NUMBER> \"<TEXT_MESSAGE>\""
}

if [ ${#} -ne 2 ] ; then
	usage
else
	sudo /etc/init.d/gammu-smsd stop
	echo "${2}" | gammu --sendsms TEXT ${1}
	sudo /etc/init.d/gammu-smsd start
fi
