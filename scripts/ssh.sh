function f_ssh {

  sudo apt-get install openssh-server -y

  sudo mv /etc/ssh/sshd_config  /etc/ssh/sshd_config.old
  sudo mv ~/ubuntu-hardening/defaults/sshd_config /etc/ssh/sshd_config

  sudo chown root:root /etc/ssh/sshd_config
  sudo chmod 0600 /etc/ssh/sshd_config

  sudo service ssh restart

  sudo ufw allow ssh
  sudo ufw allow 22

  sudo service ssh enable
  sudo service ssh restart

}
