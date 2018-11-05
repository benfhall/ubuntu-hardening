function f_users {
  echo "Configuring account settings"

  sudo cp ~/ubuntu-hardening/defaults/common-password /etc/pam.d
  sudo cp ~/ubuntu-hardening/defaults/common-auth /etc/pam.d
  sudo cp ~/ubuntu-hardening/defaults/login.defs /etc
  sudo echo "allow-guest=false" >> /etc/lightdm/lightdm.conf
  sudo passwd -l root

  USERS="$(cut -d: -f 1 /etc/passwd)" #locking users with no password
  for u in $USERS
  do
    sudo passwd -S $u | grep -Ew "NP" >/dev/null
    if [ $? -eq 0 ]; then
      sudo passwd -l $u
    fi
  done

}
