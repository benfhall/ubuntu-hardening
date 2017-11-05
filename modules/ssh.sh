function f_ssh {
  echo "allowing ssh through ufw"
  sudo ufw allow 22
  sudo ufw allow ssh

  echo "configuring ssh settings"
  sudo sed -i 's/.*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
  sudo sed -i 's/.*LoginGraceTime.*/LoginGraceTime 120/' /etc/ssh/sshd_config
  sudo sed -i 's/.*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  sudo sed -i 's/.*UseLogin.*/UseLogin no/' /etc/ssh/sshd_config
  sudo sed -i 's/.*Banner.*/Banner \/etc\/issue.net/' /etc/ssh/sshd_config
  echo "" >> /etc/ssh/sshd_config

  sudo service restart ssh
}
