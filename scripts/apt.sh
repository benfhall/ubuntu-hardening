function f_apt {

  sudo mv /etc/apt/sources.list  /etc/apt/sources.list.old
  sudo mv ~/ubuntu-hardening/defaults/sources.list /etc/apt/sources.list
  
  sudo apt-get update -y

}
