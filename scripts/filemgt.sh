function f_audit {
  echo "Managing file system"

  sudo find /home -iname "*.mp3" -delete
  sudo find /home -iname "*.jpg" -delete
  sudo find /home -iname "*.png" -delete
  sudo find /home -iname "*.mp4" -delete

  sudo sed -i 's/UMASK.*/UMASK 027/' /etc/profile
  sudo sed -i 's/TMOUT=.*/TMOUT=180/' /etc/profile

}
