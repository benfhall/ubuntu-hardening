function f_vsftpd {
  echo "Configuring vsFTPd"

  sudo sed -i 's/xferlog_enable.*//' /etc/ssh/sshd_config
  sudo echo "xferlog_enable=YES" >> /etc/ssh/sshd_config
  sudo sed -i 's/xferlog_std_format.*//' /etc/ssh/sshd_config
  sudo echo "xferlog_std_format=NO" >> /etc/ssh/sshd_config
  sudo sed -i 's/xferlog_file.*//' /etc/ssh/sshd_config
  sudo echo "xferlog_file=/var/log/vsftpd.log" >> /etc/ssh/sshd_config
  sudo sed -i 's/log_ftp_protocol.*//' /etc/ssh/sshd_config
  sudo echo "log_ftp_protocol=YES" >> /etc/ssh/sshd_config
  sudo sed -i 's/debug_ssl.*//' /etc/ssh/sshd_config
  sudo echo "debug_ssl=YES" >> /etc/ssh/sshd_config
  sudo sed -i 's/anonymous_enable.*//' /etc/ssh/sshd_config
  sudo echo "anonymous_enable=NO" >> /etc/ssh/sshd_config
  sudo sed -i 's/local_enable.*//' /etc/ssh/sshd_config
  sudo echo "local_enable=YES" >> /etc/ssh/sshd_config
  sudo sed -i 's/write_enable.*//' /etc/ssh/sshd_config
  sudo echo "write_enable=YES" >> /etc/ssh/sshd_config
  sudo sed -i 's/chroot_local_user.*//' /etc/ssh/sshd_config
  sudo echo "chroot_local_user=YES" >> /etc/ssh/sshd_config
  sudo sed -i 's/anon_mkdir_write_enable.*//' /etc/ssh/sshd_config
  sudo echo "anon_mkdir_write_enable=NO" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*//' /etc/ssh/sshd_config
  sudo echo "" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*//' /etc/ssh/sshd_config
  sudo echo "" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*//' /etc/ssh/sshd_config
  sudo echo "" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*//' /etc/ssh/sshd_config
  sudo echo "" >> /etc/ssh/sshd_config

  sudo service enable ssh
  sudo service restart ssh

}
