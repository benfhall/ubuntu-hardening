function f_ufw {

  sudo apt-get install ufw -y

  sudo ufw reset
  sudo ufw enable

  sudo service ufw restart

}
