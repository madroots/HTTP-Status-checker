#!/bin/bash
###########################################################################
#Script Name	  :http-check.sh
#Description	  :Script to check HTTP status of a service. (load from file)
#Args           :No args
#Author       	:Sim0n
#Email         	:simon.barker@linuxmail.org
###########################################################################
#
# Header ASCII Art - BEGIN
echo
clear
printf "\e[1;92m    __    __  __                   __              __  \e[0m\n"
printf "\e[1;92m   / /_  / /_/ /_____        _____/ /_  ___  _____/ /__\e[0m\n"
printf "\e[1;92m  / __ \/ __/ __/ __ \______/ ___/ __ \/ _ \/ ___/ //_/\e[0m\n"
printf "\e[1;92m / / / / /_/ /_/ /_/ /_____/ /__/ / / /  __/ /__/ ,<   \e[0m\n"
printf "\e[1;92m/_/ /_/\__/\__/ .___/      \___/_/ /_/\___/\___/_/|_|  \e[0m\n"
printf "\e[1;92m             /_/                  v1.2 made by Sim0n   \e[0m\n"
#
# Header ASCII Art - END
#
# Loader - BEGIN
echo -e "\e[93m Loading.\e[5m.\e[0m"
sleep 3 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
clear
# Loader - END
#
# Check 1st group of websites - BEGIN
echo
echo -e "\e[93m Check 1st group of websites \e[0m"      # Title - Change according to your group name
conf=servers.conf                                       # Config file - default: server.conf
while IFS= read -r srv; do
if  [[ $srv == _* ]]  ;                                 # Identifier character - Character "_" identifies 1st group of websites to check
then
srv=${srv:1}
curl -Is $srv | head -1 && echo -e "\e[37m$srv\e[0m"
fi
done < "$conf"
# Check 1st group of websites - END
#
# Check 2nd group of websites - BEGIN
echo
echo -e "\e[93m Check 2nd group of websites \e[0m"      # Title - Change according to your group name
conf=servers.conf                                       # Config file - default: server.conf
while IFS= read -r srv; do
if  [[ $srv == +* ]]  ;                                 # Identifier character - Character "+" identifies 2nd group of websites to check
then
srv=${srv:1}
curl -Is $srv | head -1 && echo -e "\e[37m$srv\e[0m"
fi
done < "$conf"
# Check 2nd group of websites - END
#
# Check 3rd group of websites - BEGIN
echo
echo -e "\e[93m Check 3rd group of websites \e[0m"      # Title - Change according to your group name
conf=servers.conf                                       # Config file - default: server.conf
while IFS= read -r srv; do
if  [[ $srv == -* ]]  ;                                 # Identifier character - Character "-" identifies 3rd group of websites to check
then
srv=${srv:1}
curl -Is $srv | head -1 && echo -e "\e[37m$srv\e[0m"
fi
done < "$conf"
# Check 3rd group of websites - END
#
#
## In case you want to add new group of websites, Copy one of the blocks above, change Title and set Identifier character of your liking. 
## Then go to servers.conf and add your websites and prefix then with Identifier character you have choosen.
