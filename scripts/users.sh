source ~/ubuntu-hardening/readme.cfg

function f_users {
  echo -n "Configuring account settings... "

  #common-passwd / common-auth / login.defs

  sudo mv /etc/pam.d/common-auth  /etc/pam.d/login.defs.old
  sudo mv ~/ubuntu-hardening/defaults/login.defs /etc/pam.d/login.defs

  sudo mv /etc/pam.d/common-password  /etc/pam.d/common-password.old
  sudo mv ~/ubuntu-hardening/defaults/common-password /etc/pam.d/common-password

  sudo mv /etc/login.defs  /etc/login.defs.old
  sudo mv ~/ubuntu-hardening/defaults/login.defs /etc/login.defs

  #disable guest account
  sudo echo "allow-guest=false" >> /etc/lightdm/lightdm.conf

  sudo passwd -l root

  #restrict sudo
  if ! grep -E '^+\s:\sroot\s:\s127.0.0.1$|^:root:127.0.0.1' /etc/security/access.conf; then
    sudo sed -i 's/^#.*root.*:.*127.0.0.1$/+:root:127.0.0.1/' /etc/security/access.conf
  fi

  if ! grep -q 'auth required' /etc/pam.d/su; then
    sudo echo "auth required pam_wheel.so" > /etc/pam.d/su
  fi

  #delete unnecessary users
  for users in games gnats irc list news sync uucp; do
    sudo userdel -r "$users" 2> /dev/null
  done

  #ask for user info
  givenAllUsers="$givenAdmins $givenUsers"
  sysUsers="$(ls /home)"
  sysAdmins=$(getent group sudo | cut -d: -f4 | tr ',' ' ')

  #delete users that aren't authorized
  for user in $sysUsers
  do
    if [[ $givenAllUsers =~ $user ]];
    then
      echo "Did not delete user $user."
      echo "$user:$passwd" | sudo chpasswd
      echo "Changed password for user $user."
    else
      read -p "Delete user $user? (y/N) >> " -n 1 -r deletionConfirmation
      echo
      if [[ $deletionConfirmation =~ ^[Yy]$ ]];
      then
        echo "Deleting user $user."
      else
        echo "Did not delete user $user."
      fi
    fi
  done

  #remove undesired admins from sudo + give admin to desired admins

  for admin in $sysAdmins
  do
    if [[ $givenAdmins =~ .*$admin.* ]]
    then
      echo "$admin is already in the admin group."
    else
      read -p "Remove $admin from admin group? (y/N) >> " -n 1 -r delAdminConfirm
      echo
      if [[ $delAdminConfirm =~ ^[Yy]$ ]]
      then
        echo "Removed $admin from the admin group."
        sudo gpasswd -d $admin sudo
      else
        echo "Did not remove $admin from the admin group."
        read -p "Add $admin to the admin group? (y/N) >> " -n 1 -r makeAdminConfirm
        echo
        if [[ $makeAdminConfirm =~ ^[Yy]$ ]]
        then
          echo "Added $admin to the admin group."
          sudo usermod -a -G sudo $admin
        else
          echo "Did not add $admin to the admin group."
        fi
      fi
    fi
  done

  #locking users with no password
  USERS="$(cut -d: -f 1 /etc/passwd)" 
  for u in $USERS
  do
    sudo passwd -S $u | grep -Ew "NP" >/dev/null
    if [ $? -eq 0 ]; then
      sudo passwd -l $u
    fi
  done

  echo "[COMPLETE]"

}
