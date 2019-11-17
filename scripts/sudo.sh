function f_sudo {

	sudo apt-get install sudo -y
	sudo sed -i "s/#.*auth.*required.*pam_wheel\.so/auth required pam_wheel\.so group=wheel debug/" /etc/pam.d/su
	sudo echo "%wheel  ALL=(ALL:ALL) ALL" >> /etc/sudoers

}