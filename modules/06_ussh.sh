function f_ussh {
  echo "denying ssh through ufw"
  sudo ufw deny 22
  sudo ufw deny ssh

  echo "removing ssh"
  sudo apt-get purge openssh
}
