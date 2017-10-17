function f_update {
  echo "updating & fixing repositories..."
  sudo apt-get install unattended-upgrades
  sudo dpkg-reconfigure -plow unattended-upgrades
  sudo apt-get update

  echo "updating software"
  sudo apt-get upgrade

  echo "clearing temp"
  sudo apt-get autoremove
  sudo apt-get autoclean
}
