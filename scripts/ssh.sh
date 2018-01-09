function f_ssh {
  echo "Configuring ssh"

  sed -i '/HostKey.*ssh_host_dsa_key.*/d' /etc/ssh/sshd_config
  sed -i 's/.*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
  sed -i 's/.*LoginGraceTime.*/LoginGraceTime 20/' /etc/ssh/sshd_config
  sed -i 's/.*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  sed -i 's/.*KeyRegenerationInterval.*/KeyRegenerationInterval 1800/' /etc/ssh/sshd_config
  sed -i 's/.*UsePrivilegeSeparation.*/UsePrivilegeSeparation sandbox/' /etc/ssh/sshd_config
  sed -i 's/.*LogLevel.*/LogLevel VERBOSE/' /etc/ssh/sshd_config
  sed -i 's/.*UseLogin.*/UseLogin no/' /etc/ssh/sshd_config
  sed -i 's/.*Banner.*/Banner \/etc\/issue.net/' /etc/ssh/sshd_config
  sed -i 's/.*Subsystem sftp.*/Subsystem sftp \/usr\/lib\/ssh\/sftp-server -f AUTHPRIV -l INFO/' /etc/ssh/sshd_config

  sudo service enable ssh
  sudo service restart ssh

}
