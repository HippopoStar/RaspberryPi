#!/bin/sh
echo "\033[32mcat /home/pi/.gammurc\033[00m"
cat /home/pi/.gammurc
echo "\033[32mcat /etc/gammurc\033[00m"
cat /etc/gammurc
echo "\033[32mcat /etc/gammu-smsdrc\033[00m"
cat /etc/gammu-smsdrc
echo "\033[32mdmesg | grep \"ttyUSB*\"\033[00m"
dmesg | grep "ttyUSB*"
echo "\033[32mgammu-detect\033[00m"
gammu-detect
echo "\033[32mgammu --identify\033[00m"
gammu --identify
echo "\033[32mgammu getsecuritystatus\033[00m"
gammu getsecuritystatus
