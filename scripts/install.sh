function f_install {
  echo "Installing neccessary software"

  sudo apt-get install tcpd
  sudo apt-get install iptables
  sudo apt-get install gufw
  sudo apt-get install lynis

  sudo service disable avahi-daemon
  sudo service disable cups
  sudo service disable rpcbind

}