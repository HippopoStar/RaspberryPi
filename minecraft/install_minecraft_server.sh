#!/bin/sh

#Server URL : [...].hopto.org
#Dans le cas ou l'on souhaite que le serveur MineCraft se lance automatiquement
#au demarrage, ajouter au fichier '/etc/rc.local' les lignes suivantes :
#	/home/pi/run-minecraft.sh > /home/pi/run-minecraft.log 2>&1

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install oracle-java8-jdk
sudo mkdir -p /home/pi/minecraft
sudo wget -P /home/pi/minecraft/ https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
sudo java -jar /home/pi/minecraft/BuildTools.jar --rev 1.12.2
cd /home/pi/minecraft/
sudo java -Xms512M -Xmx1008M -jar /home/pi/minecraft/spigot-1.12.2.jar nogui
sudo sed -i 's/false/true/g' /home/pi/minecraft/eula.txt
sudo echo "#!/bin/sh" > /home/pi/run-minecraft.sh
sudo echo "iptables -A INPUT -p TCP --dport 25565 -j ACCEPT" >> /home/pi/run-minecraft.sh
sudo echo "cd /home/pi/minecraft/" >> /home/pi/run-minecraft.sh
sudo echo "/usr/bin/java -Xms512M -Xmx1008M -jar /home/pi/minecraft/spigot-1.12.2.jar nogui" >> /home/pi/run-minecraft.sh
sudo chmod a+x /home/pi/run-minecraft.sh
