#!/bin/bash
function updatef()
{
	if echo "$updateq" | grep -iq "^y" ;then
		clear
		
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install unattended-upgrades
		sudo dpkg-reconfigure unattended-upgrades
		sudo apt-get autoremove
		sudo apt-get autoclean
		sudo freshclam
		sudo rkhunter --update
		echo "updated"
	else
		clear
		echo "did not update"
	fi
	clear
}
