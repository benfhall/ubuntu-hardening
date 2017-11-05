function f_usrmgr {
  echo "adding password requirements."
  sudo sed -i 's/sha512/sha512 minlen=8 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1/' /etc/pam.d/common-password

  echo "locking users with no password"
  USERS="$(cut -d: -f 1 /etc/passwd)"
  for u in $USERS
  do
    sudo passwd -S $u | grep -Ew "NP" >/dev/null
    if [ $? -eq 0 ]; then
      sudo passwd -l $u
    fi
  done

  echo "disabling root account"
  sudo passwd -l root
}
