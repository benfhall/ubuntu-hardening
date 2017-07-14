#!/bin/bash
function logins()
{
	if echo "$loginsq" | grep -iq "^y" ;then
		clear

		#setup pam
		sudo rm etc/security/opasswd && touch /etc/security/opasswd
		chown root:root /etc/security/opasswd
		chmod 600 /etc/security/opasswd
		sudo sed -i 's/password	required/
			password required pam_cracklib.so retry=3 minlen=13 difok=4 lcredit=0 ucredit=-1 dcredit=-1 ocredit=-2
			password required pam_unix.so md5 use_authtok remember=12 use_authtok
		/g' /etc/pam.d/common-password

		#setup login expiration
		sudo sed -i 's/PASS_MAX_DAYS/PASS_MAX_DAYS	30/s' /etc/logins.def
		sudo sed -i 's/PASS_WARN_AGE/PASS_WARN_AGE	7/s' /etc/logins.def

		sudo echo allow-guest=false >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
		sudo passwd -l root
		echo "configures login"
	else
		clear
		echo "not configuring logins"
	fi
}
