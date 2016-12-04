#!/bin/bash
#Initialisation
read -p 'Server or client do you want to install (s/c)?: ' type
case $type in
	s|S*)  product='ts3server' ;;
	c|C*)  product='ts3client' ;;
	*) product='ts3server' ;;
esac
read -p 'Which version of teamspeak do you want to install (i.e 3.0.10.1)?: ' ver
if [$ver -eq ""]; then
ver='3.0.10.1'
fi
link=""

exit