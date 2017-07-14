#!/bin/bash
function installf()
{
	if echo "$installq" | grep -iq "^y" ;then
		clear
		
    sudo apt-get update
    sudo apt-get instal ufw
    sudo apt-get install gufw
		sudo apt-get install clamav
    sudo apt-get install rkhunter
    sudo apt-get install lynis
    echo "finished installing necessary programs"
	else
		clear
		echo "skipping installations"
	fi
}
