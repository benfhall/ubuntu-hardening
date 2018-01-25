function f_network {
  echo "Configuring network settings"

  sudo echo "nospoof on" >> /etc/host.conf
  sudo sed -i 's/net.ipv4.ip_forward = 1/net.ipv4.ip_forward = 0/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv4.tcp_syncookies = 1/net.ipv4.tcp_syncookies = 0/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv6.conf.all.accept_ra = 1/net.ipv6.conf.all.accept_ra = 0/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv6.conf.default.accept_ra = 1/net.ipv6.conf.default.accept_ra = 0/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv4.conf.default.accept_redirects = 1/net.ipv4.conf.default.accept_redirects = 0/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv4.ip_forward = 1/net.ipv4.ip_forward = 0/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv4.conf.all.secure_redirects = 1/net.ipv4.conf.all.secure_redirects = 0/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv4.conf.default.secure_redirects = 1/net.ipv4.conf.default.secure_redirects = 0/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv4.conf.all.log_martians = 0/net.ipv4.conf.all.log_martians = 1/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv4.conf.default.log_martians = 0/net.ipv4.conf.default.log_martians = 1/' /etc/sysctl.conf
  sudo sed -i 's/net.ipv4.icmp_echo_ignore_broadcasts = 0/net.ipv4.icmp_echo_ignore_broadcasts = 1/' /etc/sysctl.conf
  sudo sysctl -p
  sudo echo "GRUB_CMDLINE_LINUX='ipv6.disable=1'" >> /etc/default/GRUB_CMDLINE_LINUX
  update-grub

}
