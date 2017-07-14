#!/bin/bash
function scan()
{
	if echo "$scanq" | grep -iq "^y" ;then
		clear
		
		sudo clamscan -l clamav.log -r /
		sudo rkhunter --update
		sudo lynis audit system --quick
		echo "scan is done."
		echo "clamav scan log: clamav.log"
		echo "rkhunter scan log: /var/log/rkhunter.log"
		echo "lynis scan log: /var/log/lynis.log"
	else
		clear
		echo "skipping scan"
	fi
}
