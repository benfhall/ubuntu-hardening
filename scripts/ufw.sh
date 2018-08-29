function f_ufw {
  echo "Configuring firewall"

  sudo apt-get install ufw

  sudo iptables-save > /etc/network/iptables.rules

  sudo ufw reset
  sudo ufw enable

  sudo ufw defualt deny incoming
  sudo ufw default  allow outgoing
  sudo iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --set
  sudo iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 5 -j DROP
  iptables-save > /root/my.active.firewall.rules

  sudo service enable ufw
  sudo service restart ufw

}
