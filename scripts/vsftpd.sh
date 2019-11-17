function f_vsftpd {

  apt-get install ftp -y
  mv /etc/vsftpd.conf  /etc/vsftpd.conf.old
  mv ~/ubuntu-hardening/defaults/vsftpd.conf /etc/vsftpd.conf

  chown root:root /etc/vsftpd.conf
  chmod 0600 /etc/vsftpd.conf

  service vsftpd restart

  ufw allow vsftpd

  service vsftpd enable
  service vsftpd restart

}
