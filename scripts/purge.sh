function f_purge {

  sudo apt-get remove nis -y
  sudo sed -i 's/RSYNC_ENABLE=.*/RSYNC_ENABLE=false'
  sudo apt-get remove rsh-client rsh-redone-client -y
  sudo apt-get remove talk -y
  sudo apt-get remove telnet -y
  sudo apt-get remove ldap-utils -y
  sudo sed -i 's/.*tftp/#tftp/' /etc/inetd.conf
  sudo sed -i 's/.*tftp/#tftp/' /etc/inetd.d/*
  sudo sed -i 's/.*start/#start/' /etc/init/xinetd.conf
  sudo apt-get remove openbsd-inetd -y
  sudo apt-get remove avahi-daemon avahi -y
  sudo apt-get remove cups -y
  sudo apt-get remove rpcbind -y

}
