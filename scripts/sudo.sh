function f_sudo {

	apt-get install sudo -y
	sed -i "s/#.*auth.*required.*pam_wheel\.so/auth required pam_wheel\.so group=wheel debug/" /etc/pam.d/su
	echo "%wheel  ALL=(ALL:ALL) ALL" >> /etc/sudoers

}
