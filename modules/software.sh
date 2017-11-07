function f_software {
  echo "install wanted software"
  sudo apt-get install ufw
  sudo apt-get isntall gufw
  sudo apt-get install clamav
  sudo apt-get install rkhunter
  sudo apt-get install zip
  sudo apt-get install wget

  echo "unistall common unwanted software"
  sudo apt-get purge john
  sudo apt-get purge hydra
  sudo apt-get purge transmission
}
