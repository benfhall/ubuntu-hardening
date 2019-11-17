function f_perm {

  sudo chown root:root /etc/hosts.allow
  sudo chmod 644 /etc/hosts.allow
  sudo chown root:root /etc/hosts.deny
  sudo chmod 644 /etc/hosts.deny

  sudo chown root:root /etc/passwd
  sudo chmod 644 /etc/passwd

  sudo chown root:shadow /etc/shadow
  sudo chmod o-rwx,g-wx /etc/shadow

  sudo chown root:root /etc/group
  sudo chmod 644 /etc/group

  sudo chown root:shadow /etc/gshadow
  sudo chmod o-rwx,g-rw /etc/gshadow

  sudo chown root:root /etc/passwd-
  sudo chmod u-x,go-wx /etc/passwd-

  sudo chown root:shadow /etc/shadow-
  sudo chmod o-rwx,g-rw /etc/shadow-

  sudo chown root:root /etc/group-
  sudo chmod u-x,go-wx /etc/group-

  sudo chown root:shadow /etc/gshadow-
  sudo chmod o-rwx,g-rw /etc/gshadow-
  
}