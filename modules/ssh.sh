#!/bin/bash
function sshf()
{
	if echo "$sshq" | grep -iq "^y" ;then
		clear
    sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
		sudo sed -i 's/Protocol 1/Protocol 2/g' /etc/ssh/sshd_config
    sudo ufw allow ssh
    echo "secured ssh"
	else
		clear
		echo "did not secure ssh!"
	fi
}
