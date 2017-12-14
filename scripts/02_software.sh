function f_software {
  echo "[$i] Installing and deleting software"

  sudo apt-get install ufw
  sudo apt-get isntall gufw
  sudo apt-get install clamav
  sudo apt-get install rkhunter
  sudo apt-get install zip
  sudo apt-get install wget
  sudo apt-get install auditd
  sudo apt-get purge john
  sudo apt-get purge hydra
  sudo apt-get purge transmission

  ((i++))
}
