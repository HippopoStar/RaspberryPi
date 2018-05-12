#!/bin/sh

usage () {
	echo "usage: ${0} <PHONE_NUMBER> \"<TEXT_MESSAGE>\""
}

if [ ${#} -ne 2 ] ; then
	usage
else
	echo ${2} | gammu --sendsms TEXT ${1}
fi
