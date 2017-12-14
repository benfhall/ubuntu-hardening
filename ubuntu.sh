#!/bin/bash
# Copyright (c) 2012-2016 Ben Hall
# All rights reserved.
#
# Name: ubuntu-hardening-script
# Version: 1.0.2
# PLAT:  linux-64

source scripts/update.sh
source scripts/ufw.sh
source scripts/users.sh
source scripts/network.sh
source scripts/audit.sh
source scripts/hosts.sh
source scripts/ssh.sh

clear

echo "Ubuntu Hardening Script v.1.0.2"
echo "Created by Ben Hall"
echo "Note: Designed for CyberPatriots! Any use within the CyberPatriots competition will disqualify you!"
echo
echo -n "Begin Script?"
read start
if echo "$start" | grep -iq "^y" ;then
  f_update
  f_ufw
  f_users
  f_network
  f_audit
  f_hosts

  echo "Ubuntu Hardening Script finished!"
  echo -n "Press any button to exit."
  echo
fi
