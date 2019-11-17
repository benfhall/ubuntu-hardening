function f_ufw {

  apt-get install ufw -y

  ufw reset
  ufw enable

  service ufw restart

}
