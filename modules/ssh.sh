function f_ssh {
  echo "allowing ssh through ufw"
  sudo ufw allow 22
  sudo ufw allow ssh

  echo "configuring ssh settings"
  sudo sed -i 's/.*X11Forwarding.*/X11Forwarding yes/g' /etc/ssh/sshd_config
  sudo sed -i 's/.*LoginGraceTime.*/LoginGraceTime 120/g' /etc/ssh/sshd_config
  sudo sed -i 's/.*PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
  sudo sed -i 's/.*UseLogin.*/UseLogin no/g' /etc/ssh/sshd_config
  sudo sed -i 's/.*Banner.*/Banner \/etc\/issue.net/g' /etc/ssh/sshd_config
  echo "" >> /etc/ssh/sshd_config

  sudo service restart ssh
}
