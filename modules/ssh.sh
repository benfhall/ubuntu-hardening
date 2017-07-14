#!/bin/bash
function sshf()
{
	if echo "$sshq" | grep -iq "^y" ;then
		clear

		#backup
		cp /etc/ssh/sshd_config /root/sshd_config

    sudo sed -i 's/PermitRootLogin yes//g' /etc/ssh/sshd_config
		sudo sed -i 's/PermitRootLogin no//g' /etc/ssh/sshd_config
		sudo echo "PermitRootLogin no" >> /etc/ssh/sshd_config

		sudo sed -i 's/X11Forwarding no//g' /etc/ssh/sshd_config
		sudo sed -i 's/X11Forwarding yes//g' /etc/ssh/sshd_config
		sudo echo "X11Forwarding no" >> /etc/ssh/sshd_config

		sudo sed -i 's/IgnoreRhosts yes//g' /etc/ssh/sshd_config
		sudo sed -i 's/IgnoreRhosts no//g' /etc/ssh/sshd_config
		sudo echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config

		sudo sed -i 's/PermitEmptyPasswords yes//g' /etc/ssh/sshd_config
		sudo sed -i 's/PermitEmptyPasswords no//g' /etc/ssh/sshd_config
		sudo echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config

		sudo sed -i 's/UseDNS no//g' /etc/ssh/sshd_config
		sudo sed -i 's/UseDNS yes//g' /etc/ssh/sshd_config
		sudo echo "UseDNS yes" >> /etc/ssh/sshd_config

		sudo sed -i 's/MaxAuthTries//g' /etc/ssh/sshd_config
		sudo echo "MaxAuthTries 3" >> /etc/ssh/sshd_config

		sudo sed -i 's/Protocol//g' /etc/ssh/sshd_config
		sudo echo "Protocol 2" >> /etc/ssh/sshd_config

		#enable SSL for SSH

		sudo sed -i 's/PubkeyAuthentication yes//g' /etc/ssh/sshd_config
		sudo sed -i 's/PubkeyAuthentication no//g' /etc/ssh/sshd_config
		sudo echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

		sudo sed -i 's/PasswordAuthentication yes//g' /etc/ssh/sshd_config
		sudo sed -i 's/PasswordAuthentication no//g' /etc/ssh/sshd_config
		sudo echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

    sudo ufw allow ssh
		sudo service ssh restart
		sudo service sshd restart
		echo "hardened ssh security"
	else
		clear
		echo "did not harden ssh security!"
	fi
}
