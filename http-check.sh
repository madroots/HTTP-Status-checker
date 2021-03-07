#!/bin/bash
###########################################################################
#Script Name	:website_check_status.sh
#Description	:Script to check HTTP status of a service. (load from file)
#Args           :No args
#Author       	:Sim0n
#Email         	:simon.barker@linuxmail.org
###########################################################################
#
#
echo
clear
printf "\e[1;92m    __    __  __                   __              __  \e[0m\n"
printf "\e[1;92m   / /_  / /_/ /_____        _____/ /_  ___  _____/ /__\e[0m\n"
printf "\e[1;92m  / __ \/ __/ __/ __ \______/ ___/ __ \/ _ \/ ___/ //_/\e[0m\n"
printf "\e[1;92m / / / / /_/ /_/ /_/ /_____/ /__/ / / /  __/ /__/ ,<   \e[0m\n"
printf "\e[1;92m/_/ /_/\__/\__/ .___/      \___/_/ /_/\___/\___/_/|_|  \e[0m\n"
printf "\e[1;92m             /_/                  v1.2 made by Sim0n   \e[0m\n"
#
#
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
#
#
echo
echo -e "\e[93m Nginx HTTP beeSport check \e[0m"
conf=/home/user/Desktop/bin/servers.conf
while IFS= read -r srv; do
if  [[ $srv == _* ]]  ;
then
srv=${srv:1}
curl -Is $srv | head -1 && echo -e "\e[37m$srv\e[0m"
fi
done < "$conf"
echo
echo -e "\e[93m Nginx HTTP other check \e[0m"
#
#
conf=/home/user/Desktop/bin/servers.conf
while IFS= read -r srv; do
if  [[ $srv == +* ]]  ;
then
srv=${srv:1}
curl -Is $srv | head -1 && echo -e "\e[37m$srv\e[0m"
fi
done < "$conf"
#
#
echo
echo -e "\e[93m Production beeSport HTTP check \e[0m"
#
#
conf=/home/user/Desktop/bin/servers.conf
while IFS= read -r srv; do
if  [[ $srv == -* ]]  ;
then
srv=${srv:1}
curl -Is $srv | head -1 && echo -e "\e[37m$srv\e[0m"
fi
done < "$conf"
