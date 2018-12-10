function f_pureftpd {
  echo "Configuring pure-ftpd"

  echo "yes" > /etc/pure-ftpd/conf/NoAnonymous
  echo "yes" > /etc/pure-ftpd/conf/ChrootEveryone
  echo "yes" > /etc/pure-ftpd/conf/IPV4Only
  echo "2" > /etc/pure-ftpd/conf/TLS

  sudo ufw allow 21

  sudo service pure-ftpd restart

}
