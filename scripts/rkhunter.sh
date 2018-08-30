function f_rkhunter {
	echo "Running RKHunter"

	sudo apt-get install rkhunter -y
	sudo rkhunter -c

}