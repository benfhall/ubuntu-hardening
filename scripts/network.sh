function f_network {
  echo "Configuring network settings"

  sudo echo "nospoof on" >> /etc/host.conf
  sudo sed -i 's/net.ipv4.ip_forward=1/net.ipv4.ip_forward=0/' /etc/systcl.conf
  sudo sysctl -p

}
