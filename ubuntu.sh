#!/bin/bash

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
read -p "Begin Script?" -n 1 -r
if [[ ! REPLY =~ ^[Yy]$ ]]
then
  f_update
  f_ufw
  f_users
  f_network
  f_audit
  f_hosts

  echo
fi
