function f_hosts {
  sudo -n echo "Configuring hosts files... "

  sudo echo "sshd : ALL : ALLOW" > /etc/hosts.allow
  sudo echo "ALL: LOCAL, 127.0.0.1" >> /etc/hosts.allow
  sudo echo "ALL: ALL" > /etc/hosts.deny
  chmod 644 /etc/hosts.allow
  chmod 644 /etc/hosts.deny

  sudo chmod 644 /etc/hosts.allow
  sudo chmod 644 /etc/hosts.deny

  echo "[COMPLETE]"

}
