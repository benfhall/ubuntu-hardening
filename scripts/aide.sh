function f_aide {
  echo "Configuring AIDE..."

  sudo apt-get install aide
  sudo aideinit
  sudo cp /var/lib/aide/aide.db.new /var/lib/aide/aide.db

}
