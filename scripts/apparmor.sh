function f_apparmor {
	echo "Configuring apparmor"

	sudo apt-get install apparmor apparmor-utils
	sudo sed -i 's/apparmor=.*//' /boot/grub/menu.lst
	sudo aa-enforce /etc/apparmor.d/*

	if ! grep 'pam_apparmor.so order=user,group,default' /etc/pam.d/*; then
    	echo 'session optional pam_apparmor.so order=user,group,default' > /etc/pam.d/apparmor
  	fi

	sudo find /etc/apparmor.d/ -maxdepth 1 -type f -exec aa-enforce {} \;
	sudo aa-complain /etc/apparmor.d/usr.sbin.rsyslogd

  	sudo service apparmor enable
  	sudo service apparmor restart

}
