function f_ufw {
  echo "enabling ufw"
  sudo ufw enable
  sudo ufw reset

  echo "configuring ufw"
  sudo sed 's/IPV6=no/IPV6=yes/' /etc/default/ufw
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
}
