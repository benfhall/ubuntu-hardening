function f_audit {
  echo "Managing file system"

  sudo find /home -iname "*.mp3" -delete
  sudo find /home -iname "*.jpg" -delete
  sudo find /home -iname "*.png" -delete
  sudo find /home -iname "*.mp4" -delete
  
}
