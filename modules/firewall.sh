#!/bin/bash
function ufwf()
{
	if echo "$ufwq" | grep -iq "^y" ;then
		clear
		
    sudo ufw enable
    echo "enabled/configured firewall"
	else
		clear
		echo "did not enable/configure firewall!"
	fi
}
