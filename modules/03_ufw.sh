function f_ufw {
  echo "enabling ufw"
  sudo ufw enable

  echo "configuring ufw"
  sed 's/IPV6=no/IPV6=yes/' /etc/default/ufw
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
  sudo ufw reset
}
