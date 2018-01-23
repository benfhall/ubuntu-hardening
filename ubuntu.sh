#!/bin/bash
# Copyright (c) 2015-2016 Ben Hall
# All rights reserved.
#
# Name: ubuntu-hardening-script
# Version: 1.0.3
# PLAT:  linux-64

./scripts/update.sh
./scripts/ufw.sh
./scripts/users.sh
./scripts/network.sh
./scripts/audit.sh
./scripts/hosts.sh
./scripts/ssh.sh

echo "Ubuntu Hardening Script v.1.0.2"
echo "Created by Ben Hall"
echo "Note: Designed for CyberPatriots! Any use within the CyberPatriots competition will disqualify you!"
echo
echo -n "Begin Script?"
read start
if echo "$start" | grep -iq "^y" ;then
  f_update()
  f_ufw()
  f_users()
  f_network()
  f_audit()
  f_hosts()

  echo "Ubuntu Hardening Script finished!"
  echo -n "Press any button to exit."
  echo
fi
