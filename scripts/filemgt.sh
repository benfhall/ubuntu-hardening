function f_filemgt {
  echo "Deleting media files... "

  sudo find /home -iname "*.mp3" -delete
  sudo find /home -iname "*.jpg" -delete
  sudo find /home -iname "*.png" -delete
  sudo find /home -iname "*.mp4" -delete
  sudo find /home -iname "*.ogg" -delete
  sudo find /home -iname "*.wav" -delete

  echo "[COMPLETE]"

}
