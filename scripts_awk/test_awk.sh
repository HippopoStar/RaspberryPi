#!/bin/sh
DIRECTORY=/home/pi/GitHub_RaspberryPi/scripts_awk/
cat ${DIRECTORY}test_awk.sh
echo '-----'
cat ${DIRECTORY}test_awk.txt
echo '-----'
awk '{ gsub(/ra/,"PATATE !",$0); print $0 }' ${DIRECTORY}test_awk.txt

