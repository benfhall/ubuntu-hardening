function f_network {
  echo "Configuring network settings"

  sudo echo 0 > /proc/sys/net/ipv4/ip_forward
  sudo echo "order bind,hosts" >> /etc/host.conf
  sudo echo "nospoof on" >> /etc/host.conf
  sudo echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
  sudo echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
  sudo echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
  sudo sysctl -n net.ipv4.tcp_syncookies
  sudo sysctl -p

}
