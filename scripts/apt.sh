function f_apt {

  mv /etc/apt/sources.list  /etc/apt/sources.list.old
  mv defaults/sources.list /etc/apt/sources.list
  
  apt-get update -y

}
