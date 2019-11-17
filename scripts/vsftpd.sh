function f_vsftpd {

  sudo apt-get install ftp
  sudo mv /etc/vsftpd.conf  /etc/vsftpd.conf.old
  sudo mv ~/ubuntu-hardening/defaults/vsftpd.conf /etc/vsftpd.conf

  sudo chown root:root /etc/vsftpd.conf
  sudo chmod 0600 /etc/vsftpd.conf

  sudo service vsftpd restart

  sudo ufw allow vsftpd

  sudo service vsftpd enable
  sudo service vsftpd restart

}
