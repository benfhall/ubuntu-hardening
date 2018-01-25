function f_install {
  echo "Installing neccessary software"

  sudo apt-get install tcpd
  sudo apt-get install iptables
  sudo apt-get install gufw

}
