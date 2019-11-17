function f_banners {
  
	chown root:root /etc/issue
	chmod 644 /etc/issue
	echo "Authorized uses only. All activity may be monitored and reported." >> /etc/issue
  
	chown root:root /etc/issue.net
	chmod 644 /etc/issue.net
	echo "Authorized uses only. All activity may be monitored and reported." >> /etc/issue.net

}
