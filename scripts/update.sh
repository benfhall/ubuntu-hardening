function f_update {
  echo "[$i] Updating repositories and software"

  sudo apt-get install unattended-upgrades
  sudo dpkg-reconfigure -plow unattended-upgrades
  sudo sed -i 's/APT::Periodic::Update-Package-Lists .*/APT::Periodic::Update-Package-Lists "1";/g' /etc/apt/apt.conf.d/10periodic
  sudo sed -i 's/APT::Periodic::Download-Upgradeable-Packages .*/APT::Periodic::Download-Upgradeable-Packages "1";/g' /etc/apt/apt.conf.d/10periodic
  sudo sed -i 's/APT::Periodic::AutocleanInterval "1" .*/APT::Periodic::AutocleanInterval "1";/g' /etc/apt/apt.conf.d/10periodic
  sudo sed -i 's/APT::Periodic::Unattended-Upgrade "1" .*/APT::Periodic::Unattended-Upgrade "1";/g' /etc/apt/apt.conf.d/10periodic
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get autoremove
  sudo apt-get autoclean

  ((i++))
}
