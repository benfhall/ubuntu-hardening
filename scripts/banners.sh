function f_banners {
	echo -n "Editing banners... "
  
	sudo chown root:root /etc/issue
	sudo chmod 644 /etc/issue
	sudo echo "Authorized uses only. All activity may be monitored and reported." >> /etc/issue
  
	sudo chown root:root /etc/issue.net
	sudo chmod 644 /etc/issue.net
	sudo echo "Authorized uses only. All activity may be monitored and reported." >> /etc/issue.net

	echo "[COMPLETE]"

}
