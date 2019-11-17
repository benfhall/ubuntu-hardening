function f_ssh {

  apt-get install openssh-server -y

  mv /etc/ssh/sshd_config  /etc/ssh/sshd_config.old
  mv ~/ubuntu-hardening/defaults/sshd_config /etc/ssh/sshd_config

  chown root:root /etc/ssh/sshd_config
  chmod 0600 /etc/ssh/sshd_config

  service ssh restart

  ufw allow ssh
  ufw allow 22

  service ssh enable
  service ssh restart

}
