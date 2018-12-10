function f_hosts {
  echo "Configuring hosts files"

  sudo cp ~/ubuntu-hardening/defaults/hosts /etc/
  sudo cp ~/ubuntu-hardening/defaults/host.conf /etc/

  sudo chmod 644 /etc/hosts.allow
  sudo chmod 644 /etc/hosts.deny

}
