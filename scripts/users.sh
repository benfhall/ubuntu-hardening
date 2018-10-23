function f_users {
  echo "Configuring account settings"

  sudo sed -i 's/pam.unix.so/pam_unix.so remember=5 difok=3 retry=3 minlen=8 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1/' /etc/pam.d/common-password
  sudo echo "auth required pam_tally2.so deny=5 onerr=fail unlock_time=1800" >> /etc/pam.d/common-auth
  sudo sed -i 's/PASS_MAX_DAYS/#PASS_MAX_DAYS/' /etc/login.defs
  sudo sed -i 's/PASS_MIN_DAYS/#PASS_MIN_DAYS/' /etc/login.defs
  sudo sed -i 's/PASS_WARN_AGE/#PASS_WARN_AGE/' /etc/login.defs
  sudo echo "PASS_MAX_DAYS  90" >> /etc/login.defs
  sudo echo "PASS_MIN_DAYS  14" >> /etc/login.defs
  sudo echo "PASS_WARN_AGE  7" >> /etc/login.defs
  sudo echo "allow-guest=false" >> /etc/lightdm/lightdm.conf
  sudo passwd -l root

  sudo sed -i 's/exec shutdown -r now “Control-Alt-Delete pressed”//' /etc/init/control-alt-delete.conf

  sed -i 's/^#KillUserProcesses=no/KillUserProcesses=1/' /etc/systemd/logind.conf
  sed -i 's/^#KillExcludeUsers=root/KillExcludeUsers=root/' /etc/systemd/logind.conf
  sed -i 's/^#IdleAction=ignore/IdleAction=lock/' /etc/systemd/logind.conf
  sed -i 's/^#IdleActionSec=30min/IdleActionSec=15min/' /etc/systemd/logind.conf
  sed -i 's/^#RemoveIPC=yes/RemoveIPC=yes/' /etc/systemd/logind.conf

  USERS="$(cut -d: -f 1 /etc/passwd)" #locking users with no password
  for u in $USERS
  do
    sudo passwd -S $u | grep -Ew "NP" >/dev/null
    if [ $? -eq 0 ]; then
      sudo passwd -l $u
    fi
  done

}
