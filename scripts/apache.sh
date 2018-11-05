function f_apache {
  echo "Configuring apache"

  sudo cp ~/ubuntu-hardening/defaults/apache2.conf /etc/apache2/apache2.conf

  a2dismod -f autoindex
  a2enmod headers

  sudo iptables -I INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --set
  sudo iptables -I INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 5 -j DROP
  iptables-save > /root/my.active.firewall.rules

  sudo service apache2 enable
  sudo service apache2 restart

}
