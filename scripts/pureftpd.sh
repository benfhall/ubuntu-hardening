function f_pureftpd {
  sudo echo "Configuring pure-ftpd"

  sudo echo "yes" > /etc/pure-ftpd/conf/NoAnonymous
  sudo echo "yes" > /etc/pure-ftpd/conf/ChrootEveryone
  sudo echo "yes" > /etc/pure-ftpd/conf/IPV4Only
  sudo echo "2" > /etc/pure-ftpd/conf/TLS
  sudo apt-get install ftp

  sudo ufw allow 21

  sudo service pure-ftpd restart

}
