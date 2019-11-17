function f_filemgt {

  sudo find /home -iname "*.mp3" -delete
  sudo find /home -iname "*.jpg" -delete
  sudo find /home -iname "*.png" -delete
  sudo find /home -iname "*.mp4" -delete
  sudo find /home -iname "*.ogg" -delete
  sudo find /home -iname "*.wav" -delete

}
