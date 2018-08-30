function f_banners {
	echo "Editing banners."

	sudo chown root:root /etc/motd
	sudo sudo chmod 644 /etc/motd
	sudo echo "Authorized uses only. All activity may be monitored and reported." > /etc/motd
  
	sudo chown root:root /etc/issue
	sudo chmod 644 /etc/issue
	sudo echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue
  
	sudo chown root:root /etc/issue.net
	sudo chmod 644 /etc/issue.net
	sudo echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue.net

}