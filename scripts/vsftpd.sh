function f_vsftpd {
  echo -n "Configuring vsFTPd... "

  sudo apt-get install ftp
  sudo mv /etc/vsftpd.conf  /etc/vsftpd.conf.old
  sudo mv ~/ubuntu-hardening/defaults/vsftpd.conf /etc/vsftpd.conf

  chown root:root /etc/vsftpd.conf
  chmod 0600 /etc/vsftpd.conf

  sudo service vsftpd restart

  sudo ufw allow vsftpd

  sudo service vsftpd enable
  sudo service vsftpd restart

  echo "[COMPLETE]"

}
