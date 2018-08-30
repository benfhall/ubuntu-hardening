function f_vsftpd {
  echo "Configuring vsFTPd"

  sudo sed -i 's/.*anonymous_enable=.*//' /etc/vsftpd.conf
  sudo echo "anonymous_enable=NO" >> /etc/vsftpd.conf
  sudo sed -i 's/local_enable=.*//' /etc/vsftpd.conf
  sudo echo "local_enable=YES" >> /etc/vsftpd.conf
  sudo sed -i 's/chroot_local_user=.*//' /etc/vsftpd.conf
  sudo echo "chroot_local_user=YES" >> /etc/vsftpd.conf
  sudo sed -i 's/xferlog_std_format=.*//' /etc/vsftpd.conf
  sudo echo "xferlog_std_format=NO" >> /etc/vsftpd.conf
  sudo sed -i 's/ftpd_banner=.*//' /etc/vsftpd.conf
  sudo echo "ftpd_banner=Secure FTP Server" >> /etc/vsftpd.conf

  sudo service enable vsftpd
  sudo service restart vsftpd

}
