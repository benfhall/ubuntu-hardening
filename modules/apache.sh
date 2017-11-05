function f_apache {
	echo "configure apache"
  sudo sed -i 's/ServerTokens .*/ServerTokens Prod/g' /etc/apache2/conf-enabled/security.conf
  sudo sed -i 's/ServerSignature .*/ServerTokens Off/g' /etc/apache2/conf-enabled/security.conf
  sudo sed -i 's/TraceEnable .*/TraceEnable Off/g' /etc/apache2/conf-enabled/security.conf
  sudo sed -i 's/Header .*/Header unset ETag/g' /etc/apache2/conf-enabled/security.conf
  sudo sed -i 's/FileETag .*/FileETag None/g' /etc/apache2/conf-enabled/security.conf
  sudo ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load
  sudo apt-get install libapache2-mod-security2
  sudo mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf
  sudo sed -i 's/SecRuleEngine .*/SecRuleEngine On/g' /etc/modsecurity/modsecurity.conf
  sudo sed -i 's/SecRuleEngine .*/SecRuleEngine On/g' /etc/modsecurity/modsecurity.conf
  sudo sed -i 's/SecRequestBodyLimit .*/SecRequestBodyLimit 16384000/g' /etc/modsecurity/modsecurity.conf
  sudo sed -i 's/SecRequestBodyInMemoryLimit .*/SecRequestBodyInMemoryLimit 16384000/g' /etc/modsecurity/modsecurity.conf
  sudo service apache2 restart

	echo "allowing vsftpd through firewall"
	sudo ufw allow vsftpd
	sudo ufw allow 21
}
