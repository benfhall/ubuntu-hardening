#!/bin/bash

clear

for s in ./scripts/[0-9_]*; do
  [[ -e $s ]] || break
  source "$s"
done

f_update
f_ufw
f_users
f_network
f_audit
f_hosts

echo
