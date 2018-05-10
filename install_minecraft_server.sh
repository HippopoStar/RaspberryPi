#!/bin/sh
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install oracle-java8-jdk
sudo mkdir -p /home/minecraft
sudo wget -P /home/minecraft/ https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
sudo java -jar /home/minecraft/BuildTools.jar --rev 1.12.2
sudo java -Xms512M -Xmx1008M -jar /home/minecraft/spigot-1.12.2.jar nogui
sudo sed -i 's/false/true/g' /home/minecraft/eula.txt
echo "#!/bin/sh" > /home/minecraft/run-minecraft.sh
echo "/usr/bin/java -Xms512M -Xmx1008M -jar /home/minecraft/spigot-1.12.2.jar nogui" >> /home/minecraft/run-minecraft.sh
sudo chmod a+x /home/minecraft/run-minecraft.sh

