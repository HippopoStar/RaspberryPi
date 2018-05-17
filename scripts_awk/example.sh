#!/bin/sh

TOTAL_LINES=7

ls -l /home/pi/ |\
awk -v TOTAL_LINES=$TOTAL_LINES 'BEGIN { print "On va afficher dans un premier temps le dernier champ des ligne 2 a " TOTAL_LINES ",\npuis le nombre total de lignes parcourues\nDEBUT" }
2 <= NR && NR <= TOTAL_LINES { print $(NF) }
END { print NR "\nFIN" }'

