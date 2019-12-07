function f_ssh {

  apt-get install openssh-server -y

  mv /etc/ssh/sshd_config  /etc/ssh/sshd_config.old
  mv defaults/sshd_config /etc/ssh/sshd_config

  chown root:root /etc/ssh/sshd_config
  chmod 0600 /etc/ssh/sshd_config
  
  iptables -I INPUT -p tcp --dport ssh -i eth0 -m state --state NEW -m recent  --set
  iptables -I INPUT -p tcp --dport ssh -i eth0 -m state --state NEW -m recent  --update --seconds 15 --hitcount 3 -j DROP

  ufw allow ssh
  ufw allow 22

}
