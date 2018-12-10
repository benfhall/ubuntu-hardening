function f_purge {
  echo "Purging vulnerable software..."

  sudo apt-get remove nis
  sudo sed -i 's/RSYNC_ENABLE=.*/RSYNC_ENABLE=false'
  sudo apt-get remove rsh-client rsh-redone-client
  sudo apt-get remove talk
  sudo apt-get remove telnet
  sudo apt-get remove ldap-utils
  sudo sed -i 's/.*tftp/#tftp/' /etc/inetd.conf
  sudo sed -i 's/.*tftp/#tftp/' /etc/inetd.d/*
  sudo sed -i 's/.*start/#start/' /etc/init/xinetd.conf
  sudo apt-get remove openbsd-inetd

}
