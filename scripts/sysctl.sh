function f_sysctl {
  echo "Configuring network settings"

  sudo cp ~/ubuntu-hardening/defaults/sysctl.conf /etc

  sudo sysctl -p

}
