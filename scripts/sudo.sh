function f_sudo {

	apt-get install sudo -y
	echo 'auth required pam_wheel.so use_uid' >> /etc/pam.d/su
	echo "%wheel  ALL=(ALL:ALL) ALL" >> /etc/sudoers

}
