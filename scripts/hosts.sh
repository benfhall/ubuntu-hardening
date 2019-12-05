function f_hosts {

  echo "sshd : ALL : ALLOW" > /etc/hosts.allow
  echo "ALL: LOCAL, 127.0.0.1" >> /etc/hosts.allow
  echo "ALL: ALL" > /etc/hosts.deny
  chmod 644 /etc/hosts.allow
  chmod 644 /etc/hosts.deny
  chown root:root /etc/hosts.allow
  chown root:root /etc/hosts.deny

}
