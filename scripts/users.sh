source ~/ubuntu-hardening/readme.cfg

function f_users {
  echo "Configuring account settings"

  #common-password/auth
  if ! grep pam_pwhistory.so /etc/pam.d/common-password; then
    sed -i '/the "Primary" block/apassword\trequired\t\t\tpam_pwhistory.so\tremember=5' /etc/pam.d/common-password
  fi

  sed -i 's/^password[\t].*.pam_cracklib.*/password\trequired\t\t\tpam_cracklib.so retry=3 maxrepeat=3 minlen=8 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 difok=8/' /etc/pam.d/common-password
  sed -i 's/try_first_pass sha512.*/try_first_pass sha512/' /etc/pam.d/common-password
  sed -i 's/nullok_secure//' /etc/pam.d/common-auth

  if ! grep tally2 /etc/pam.d/common-auth; then
    sed -i '/^$/a auth required pam_tally2.so onerr=fail audit silent deny=5 unlock_time=900' /etc/pam.d/common-auth
    sed -i '/pam_tally/d' /etc/pam.d/common-account
    echo 'account required pam_tally2.so' >> /etc/pam.d/common-account
  fi

  sed -i 's/pam_lastlog.so.*/pam_lastlog.so showfailed/' /etc/pam.d/login
  sed -i 's/delay=.*/delay=4000000/' /etc/pam.d/login

  #login.defs
  sed -i 's/^.*LOG_OK_LOGINS.*/LOG_OK_LOGINS yes/' /etc/login.defs
  sed -i 's/^UMASK.*/UMASK 077/' /etc/login.defs
  sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS 1/' /etc/login.defs
  sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS 60/' /etc/login.defs
  sed -i 's/DEFAULT_HOME.*/DEFAULT_HOME no/' /etc/login.defs
  sed -i 's/ENCRYPT_METHOD.*/ENCRYPT_METHOD SHA512/' /etc/login.defs
  sed -i 's/USERGROUPS_ENAB.*/USERGROUPS_ENAB no/' /etc/login.defs
  sed -i 's/^# SHA_CRYPT_MAX_ROUNDS.*/SHA_CRYPT_MAX_ROUNDS 10000/' /etc/login.defs
  
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

  #delete users that aren't given
  ls /home > ~/ubuntu-hardening/users.cfg
  cat users.cfg | tr '\n' ' ' > users_clean.cfg
  ALLUSERS=`cat users_clean.cfg`

  for u in $ALLUSERS
  do
    if [[ $DESIREDUSERS =~ .*$u.* ]]
    then
      echo
    else
      read -p "Delete user $u?" -n 1 -r deletionConfirmation
      echo
      if [[ $deletionConfirmation =~ ^[Yy]$ ]]
      then
          sudo deluser $u
      fi
    fi
  done

  for u in $SIMPLEPASSWD
  do
    sudo passwd -l $u
  done

  #remove undesired admins from sudo + give admin to desired admins
  > ~/ubuntu-hardening/sudoers.cfg
  getent group sudo | cut -d: -f4 >> ~/ubuntu-hardening/sudoers.cfg
  sudo sed -i 's/,/ /g' sudoers.cfg
  ALLADMINS=`cat sudoers.cfg`

  for u in $ALLADMINS
  do
    if [[ $DESIREDADMINS =~ .*$u.* ]]
    then
      read -p "Make user $u an admin?" -n 1 -r makeAdminConfirm
      echo
      if [[ $makeAdminConfirm =~ ^[Yy]$ ]]
      then
          sudo usermod -a -G sudo $u
      fi
    else
      read -p "Make user $u an admin?" -n 1 -r delAdminConfirm
      echo
      if [[ $delAdminConfirm =~ ^[Yy]$ ]]
      then
          sudo gpasswd -d $u sudo
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

}
