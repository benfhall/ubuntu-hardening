function f_pureftpd {
  sudo echo -n "Configuring pure-ftpd... "

  sudo echo "yes" > /etc/pure-ftpd/conf/NoAnonymous
  sudo echo "yes" > /etc/pure-ftpd/conf/ChrootEveryone
  sudo echo "yes" > /etc/pure-ftpd/conf/IPV4Only
  sudo echo "2" > /etc/pure-ftpd/conf/TLS
  sudo apt-get install ftp

  sudo service pure-ftpd restart
  sudo ufw allow pure-ftpd
  sudo service pure-ftpd enable
  sudo service pure-ftpd restart

  echo "[COMPLETE]"

}
