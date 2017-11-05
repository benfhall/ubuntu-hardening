#!/bin/bash
#source modules
source modules/update.sh
source modules/software.sh
source modules/ufw.sh
source modules/usrmgr.sh
source modules/ssh.sh
source modules/ftp.sh
source modules/apache.sh
source modules/media.sh
clear

echo -n "Do you want to update repositories and programs (y/N)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
  f_update
fi
clear

echo -n "Do you want to install/uninstall software (y/N)? "
if echo "$answer" | grep -iq "^y" ;then
  f_software
fi
clear

echo -n "Do you want to configure the firewall (y/N)? "
if echo "$answer" | grep -iq "^y" ;then
  f_ufw
fi
clear

echo -n "Do you want to manage users (y/N)? "
if echo "$answer" | grep -iq "^y" ;then
  f_usrmgr
fi
clear

echo -n "Do you want to configure ssh (y/N)? "
if echo "$answer" | grep -iq "^y" ;then
  f_ssh
fi
clear

echo -n "Do you want to configure vsftpd (y/N)? "
if echo "$answer" | grep -iq "^y" ;then
  f_ftp
fi
clear

echo -n "Do you want to configure apache (y/N)? "
if echo "$answer" | grep -iq "^y" ;then
  f_apache
fi
clear

echo -n "Do you want to remove media files (y/N)? "
if echo "$answer" | grep -iq "^y" ;then
  f_media
fi
clear

echo "Thank you for running my script! Check the README.md file for information on what it did."
exit
