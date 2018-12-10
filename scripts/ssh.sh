function f_ssh {
  echo "Configuring ssh"

  sudo cp ~/ubuntu-hardening/defaults/sshd_config /etc/ssh

  sudo ufw allow ssh
  sudo ufw allow 22

  sudo service ssh enable
  sudo service ssh restart
}
