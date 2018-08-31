function f_boot {
  echo "Configuring boot settings..."

  sudo chown root:root /boot/grub/grub.cfg
  sudo chmod og-rwx /boot/grub/grub.cfg
  sudo grub-mkpasswd-pbkdf2

}
