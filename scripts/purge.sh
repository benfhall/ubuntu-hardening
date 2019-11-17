function f_purge {

  apt-get remove nis -y
  sed -i 's/RSYNC_ENABLE=.*/RSYNC_ENABLE=false'
  apt-get remove rsh-client rsh-redone-client -y
  apt-get remove talk -y
  apt-get remove telnet -y
  apt-get remove ldap-utils -y
  sed -i 's/.*tftp/#tftp/' /etc/inetd.conf
  sed -i 's/.*tftp/#tftp/' /etc/inetd.d/*
  sed -i 's/.*start/#start/' /etc/init/xinetd.conf
  apt-get remove openbsd-inetd -y
  apt-get remove avahi-daemon avahi -y
  apt-get remove cups -y
  apt-get remove rpcbind -y

}
