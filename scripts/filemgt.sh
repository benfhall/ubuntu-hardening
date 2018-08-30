function f_audit {
  echo "Managing file system"

  sudo find /home -iname "*.mp3" -delete
  sudo find /home -iname "*.jpg" -delete
  sudo find /home -iname "*.png" -delete
  sudo find /home -iname "*.mp4" -delete

  sudo chown root:root /etc/passwd
  sudo chmod 644 /etc/passwd
  sudo chown root:shadow /etc/shadow
  sudo chmod 640 /etc/shadow
  sudo chown root:root /etc/group
  sudo chmod 644 /etc/group
  sudo chown root:shadow /etc/gshadow
  sudo chmod 640 /etc/group
  sudo chown root:root /etc/security/opasswd
  sudo chmod 600 /etc/security/opasswd
  sudo chown root:root /etc/passwd-
  sudo chmod 600 /etc/passwd-
  sudo chown root:root /etc/shadow-
  sudo chmod 600 /etc/shadow-
  sudo chown root:root /etc/group-
  sudo chmod 600 /etc/group-
  sudo chown root:root /etc/gshadow-
  sudo chmod 600 /etc/gshadow-

}