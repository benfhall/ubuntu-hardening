#!/bin/bash
# Copyright (c) 2015-2016 Ben Hall
# All rights reserved.
#
# Name: ubuntu-hardening-scriptst
# Version: 1.0.3
# PLAT:  linux-64
# PLAT-Version: linux-14.04

sudo chmod 755 scripts -R #ensure source can access modules

source scripts/update.sh
source scripts/ufw.sh
source scripts/users.sh
source scripts/sysctl.sh
source scripts/hosts.sh
source scripts/ssh.sh
source scripts/perm.sh
source scripts/apache.sh
source scripts/php.sh
source scripts/vsftpd.sh

echo "Ubuntu Hardening Script v.1.0.3 for Ubuntu 14.04"
echo "Created by Ben Hall"
echo "Note: Designed for CyberPatriots! Any use within the CyberPatriots competition will disqualify you!"
echo

read -p "Update software and repository? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_update
fi

read -p "Install needed software? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_install
fi

read -p "Configure the firewall? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_ufw
fi

read -p "Configure permissions? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_perm
fi

read -p "Configure account settings? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_users
fi

read -p "Configure sysctl? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_sysctl
fi

read -p "Configure hosts file? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_hosts
fi

read -p "Configure ssh? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_ssh
fi

read -p "Configure apache? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_apache
fi

read -p "Configure PHP? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_php
fi

read -p "Configure vsFTPd? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_php
fi

echo "Ubuntu Hardening Script finished!"
echo -n "Press any button to exit."
echo
