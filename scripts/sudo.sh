function f_sudo {
	echo "Configuring sudo"

	sudo apt-get install sudo
	sudo groupadd wheel
	sudo usermod -aG wheel $1
	sudo sed -i "s/#.*auth.*required.*pam_wheel\.so/auth required pam_wheel\.so group=wheel debug/" /etc/pam.d/su
	sudo echo "%wheel  ALL=(ALL:ALL) ALL" >> /etc/sudoers

}

