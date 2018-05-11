#!/bin/sh

#Ajouter la ligne suivante au fichier '/etc/rc.local' :
#	/home/pi/iptables_openclassrooms.sh > /home/pi/iptables_openclassrooms.log 2>&1

iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p tcp --dport www -j ACCEPT
iptables -A INPUT -p tcp --dport imap2 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -P INPUT DROP
