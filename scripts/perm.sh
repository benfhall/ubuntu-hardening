function f_perm {
  echo -n "Settings permissions... "

  sudo chown root:root /etc/hosts.allow
  sudo chmod 644 /etc/hosts.allow
  sudo chown root:root /etc/hosts.deny
  sudo chmod 644 /etc/hosts.deny

  echo "[COMPLETE]"
  
}