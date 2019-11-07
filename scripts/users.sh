source ~/ubuntu-hardening/readme.cfg

function f_users {
  echo "Configuring account settings"

  sudo cp ~/ubuntu-hardening/defaults/common-password /etc/pam.d
  sudo cp ~/ubuntu-hardening/defaults/common-auth /etc/pam.d
  sudo cp ~/ubuntu-hardening/defaults/login.defs /etc
  sudo echo "allow-guest=false" >> /etc/lightdm/lightdm.conf
  sudo passwd -l root

  ls /home > ~/ubuntu-hardening/users.cfg
  cat users.cfg | tr '\n' ' ' > users_clean.cfg
  ALLUSERS=`cat users_clean.cfg`

  for u in $ALLUSERS
  do
    if [[ $DESIREDUSERS =~ .*$u.* ]]
    then
      echo
    else
      sudo deluser $u
    fi
  done

  for u in $SIMPLEPASSWD
  do
    sudo passwd -l $u
  done

  > ~/ubuntu-hardening/sudoers.cfg
  getent group sudo | cut -d: -f4 >> ~/ubuntu-hardening/sudoers.cfg
  sudo sed -i 's/,/ /g' sudoers.cfg
  ALLADMINS=`cat sudoers.cfg`

  for u in $ALLADMINS
  do
    if [[ $DESIREDADMINS =~ .*$u.* ]]
    then
      sudo usermod -a -G sudo $u
    else
      sudo gpasswd -d $u sudo
    fi
  done

  USERS="$(cut -d: -f 1 /etc/passwd)" #locking users with no password
  for u in $USERS
  do
    sudo passwd -S $u | grep -Ew "NP" >/dev/null
    if [ $? -eq 0 ]; then
      sudo passwd -l $u
    fi
  done

}
