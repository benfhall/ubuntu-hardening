function f_media {
  echo "removing media files"
  sudo find /home -name \*.mp3 -exec rm {} \
  sudo find /home -name \*.mp4 -exec rm {} \
}
