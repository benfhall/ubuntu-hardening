function f_proftpd {

  apt-get install --reinstall proftpd

  mv /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.old
  mv defaults/proftpd.conf /etc/proftpd/proftpd.conf

  rm /etc/proftpd/conf.d/anonymous.conf
  
  apt-get install ftp -y
  ufw allow 21

}
