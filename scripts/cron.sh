function f_cron {
  echo "Configuring cron"

  sudo rm /etc/cron.deny 2> /dev/null
  sudo rm /etc/at.deny 2> /dev/null

  sudo echo 'root' > /etc/cron.allow
  sudo echo 'root' > /etc/at.allow

  sudo chown root:root /etc/cron*
  sudo chmod og-rwx /etc/cron*

  sudo chown root:root /etc/at*
  sudo chmod og-rwx /etc/at*

  sudo systemctl mask atd.service
  sudo systemctl stop atd.service
  sudo systemctl daemon-reload

  sudo -i 's/^#cron./cron./' /etc/rsyslog.d/50-default.conf

}
