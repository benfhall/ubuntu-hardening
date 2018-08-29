function f_hosts {
  echo "Configuring hosts files"

  sudo echo "order bind,hosts" > /etc/host.conf
  sudo echo "nospoof on" >> /etc/host.conf

}
