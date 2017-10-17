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

echo -n "Do you want to configure/uninstall ssh (y/n)? "
if echo "$answer" | grep -iq "^y" ;then
  f_ssh
else
  f_ussh
fi
clear
