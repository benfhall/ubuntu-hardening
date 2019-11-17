function f_perm {

  chown root:root /etc/hosts.allow
  chmod 644 /etc/hosts.allow
  chown root:root /etc/hosts.deny
  chmod 644 /etc/hosts.deny

  chown root:root /etc/passwd
  chmod 644 /etc/passwd

  chown root:shadow /etc/shadow
  chmod o-rwx,g-wx /etc/shadow

  chown root:root /etc/group
  chmod 644 /etc/group

  chown root:shadow /etc/gshadow
  chmod o-rwx,g-rw /etc/gshadow

  chown root:root /etc/passwd-
  chmod u-x,go-wx /etc/passwd-

  chown root:shadow /etc/shadow-
  chmod o-rwx,g-rw /etc/shadow-

  chown root:root /etc/group-
  chmod u-x,go-wx /etc/group-

  chown root:shadow /etc/gshadow-
  chmod o-rwx,g-rw /etc/gshadow-
  
}