function f_ssh {
  echo "Configuring ssh"

  sudo cp ~/ubuntu-hardening/defaults/sshd_config /etc/ssh

  sudo iptables -I INPUT -p tcp --dport 6211 -i eth0 -m state --state NEW -m recent --set
  sudo iptables -I INPUT -p tcp --dport 6211 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 5 -j DROP
  iptables-save > /root/my.active.firewall.rules

  sudo service ssh enable
  sudo service ssh restart
}
