function f_ufw {
  echo -n "Configuring firewall... "

  sudo apt-get install ufw

  sudo ufw reset
  sudo ufw enable

  sudo service ufw restart

  echo "[COMPLETE]"

}
