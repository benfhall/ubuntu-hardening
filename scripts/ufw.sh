function f_ufw {
  echo "Configuring firewall"

  sudo apt-get install ufw

  sudo iptables-save > /etc/network/iptables.rules

  sudo ufw reset
  sudo ufw enable

  sudo ufw defualt deny incoming
  sudo ufw default  allow outgoing

  sudo service enable ufw
  sudo service restart ufw

}