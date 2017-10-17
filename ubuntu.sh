#!/bin/bash
#source modules
for s in ./modules/[0-9_.sh]*; do
  [[ -e $s ]] || break
  source "$s"
done

#requirements
if ! ps -p $$ | grep -i bash; then
       echo "bash required. Exiting."
       exit 1
fi
clear

echo -n "Do you want to update repositories and programs (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
  f_update
fi
clear

echo -n "Do you want to install/uninstall software (y/n)? "
if echo "$answer" | grep -iq "^y" ;then
  f_software
fi
clear

echo -n "Do you want to configure the firewall (y/n)? "
if echo "$answer" | grep -iq "^y" ;then
  f_ufw
fi
clear

echo -n "Do you want to configure password requirements (y/n)? "
if echo "$answer" | grep -iq "^y" ;then
  f_passwd
fi
clear

<<<<<<< HEAD
echo -n "Do you want to configure/uninstall ssh (y/n)? "
if echo "$answer" | grep -iq "^y" ;then
  f_ssh
else
  f_ussh
fi
clear
=======
f_pre
f_firewall
f_disablenet
f_disablemnt
f_disablemod
f_systemdconf
f_resolvedconf
f_logindconf
f_journalctl
f_timesyncd
f_coredump
f_fstab
f_prelink
f_aptget
f_hosts
f_issue
f_logindefs
f_sysctl
f_limitsconf
f_adduser
f_rootaccess
f_packages
f_postfix
f_apport
f_motdnews
f_rkhunter
f_sshdconfig
f_password
f_cron
f_ctrlaltdel
f_auditd
f_aide
f_rhosts
f_users
f_lockroot
f_aptget_clean
f_suid
f_umask
f_path
f_aa_enforce
f_aide_post
f_aide_timer
f_vsftpd
f_systemddelta
f_checkreboot
>>>>>>> 419b964b478b598dedbad0d0c08b1132e8a7881c
