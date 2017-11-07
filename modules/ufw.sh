function f_ufw {
  echo "enabling ufw"
  sudo ufw enable
  sudo ufw reset

  echo "configuring ufw"
  sudo sed 's/IPV6=yes/IPV6=no/' /etc/default/ufw
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
}
