function f_ssh {
  sudo echo -n "Configuring ssh... "

  sudo mv /etc/ssh/sshd_config  /etc/ssh/sshd_config.old
  sudo mv ~/ubuntu-hardening/defaults/sshd_config /etc/ssh/sshd_config

  chown root:root /etc/ssh/sshd_config
  chmod 0600 /etc/ssh/sshd_config

  sudo service ssh restart

  sudo ufw allow ssh
  sudo ufw allow 22

  sudo service ssh enable
  sudo service ssh restart

  echo "[COMPLETE]"
}
