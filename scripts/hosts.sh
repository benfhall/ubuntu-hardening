function f_hosts {
  echo "[$i] Configuring hosts files"

  sudo echo "sshd : ALL : ALLOW" > /etc/hosts.allow
  sudo echo "ALL: LOCAL, 127.0.0.1" >> /etc/hosts.allow
  sudo echo "ALL: PARANOID" > /etc/hosts.deny
  sudo chmod 644 /etc/hosts.allow
  sudo chmod 644 /etc/hosts.deny

}
