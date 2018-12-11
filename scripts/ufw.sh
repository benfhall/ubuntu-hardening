function f_ufw {
  echo "Configuring firewall"

  sudo apt-get install ufw

  sudo ufw reset
  sudo ufw enable

  sudo service ufw restart

}
