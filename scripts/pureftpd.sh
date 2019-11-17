function f_pureftpd {

  apt-get install pure-ftpd -y

  echo "yes" > /etc/pure-ftpd/conf/NoAnonymous
  echo "yes" > /etc/pure-ftpd/conf/ChrootEveryone
  echo "yes" > /etc/pure-ftpd/conf/IPV4Only
  echo "2" > /etc/pure-ftpd/conf/TLS
  apt-get install ftp -y

  service pure-ftpd restart
  ufw allow pure-ftpd
  service pure-ftpd enable
  service pure-ftpd restart

}
