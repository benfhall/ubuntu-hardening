#!/bin/bash

if ! ps -p $$ | grep -i bash; then
       echo "Sorry, this script requires bash."
       exit 1
fi

if ! [ -x "$(which upstart)" ]
  then
    echo "upstart required. Exiting."
    exit 1
fi

clear

source ./ubuntu.cfg

for s in ./scripts/[0-9_]*; do
  [[ -e $s ]] || break
  source "$s"
done

f_update
f_software
f_ufw
f_users
f_network
f_audit

echo
