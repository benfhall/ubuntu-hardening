#!/bin/bash
# Copyright (c) 2015-2016 Ben Hall
# All rights reserved.
#
# Name: ubuntu-hardening-scriptst
# Version: 1.0.3
# PLAT:  linux-64
# PLAT-Version: linux-14.04

sudo chmod 755 scripts -R #ensure source can access modules

source scripts/apt.sh
source scripts/ufw.sh
source scripts/users.sh
source scripts/sysctl.sh
source scripts/hosts.sh
source scripts/perm.sh
source scripts/cron.sh
source scripts/audit.sh
source scripts/banners.sh
source scripts/sudo.sh
source scripts/process.sh
source scripts/aide.sh
source scripts/php.sh
source scripts/apache.sh
source scripts/vsftpd.sh
source scripts/ssh.sh
source scripts/nginx.sh
source scripts/samba.sh
source scripts/pureftpd.sh
source scripts/purge.sh
source scripts/malware.sh
source scripts/filemgt.sh
source scripts/apparmor.sh

echo "Ubuntu Hardening Script v.1.0.3 for Ubuntu 14.04"
echo "Created by Ben Hall"
echo "Note: Designed for CyberPatriots! Any use within the CyberPatriots competition will disqualify you!"
echo

read -p "Configure/Install apt? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_apt
fi

read -p "Configure the firewall? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_ufw
fi

read -p "Configure account settings? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_users
fi

read -p "Configure hosts file? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_hosts
fi

read -p "Manage file system? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_filemgt
fi

read -p "Configure sysctl? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_sysctl
fi

read -p "Configure audit? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_audit
fi

read -p "Configure PHP? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_php
fi

read -p "Configure apparmor? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_apparmor
fi

read -p "Edit banners? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_banners
fi

read -p "Configure sudo? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_sudo
fi

read -p "Harden processes? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_process
fi

read -p "Configure AIDE?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_aide
fi

read -p "Configure permissions?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_perm
fi

read -p "Uninstall malicious software?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_malware
fi

read -p "Purge vulnerable software??" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  f_purge
fi

if [[ $DESIREDUSERS =~ .*ssh.* ]]
then
    f_ssh
else
    read -p "Remove ssh?" -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge ssh
    fi
fi

if [[ $DESIREDUSERS =~ .*vsftpd.* ]]
then
    f_vsftpd
else
    read -p "Remove vsftpd?" -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge vsftpd
    fi
fi

if [[ $DESIREDUSERS =~ .*nginx.* ]]
then
    f_nginx
else
    read -p "Remove nginx?" -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge nginx
    fi
fi

if [[ $DESIREDUSERS =~ .*samba.* ]]
then
    f_samba
else
    read -p "Remove samba?" -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge samba
    fi
fi

if [[ $DESIREDUSERS =~ .*mysql.* ]]
then
    f_mysql
else
    read -p "Remove mysql?" -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge mysql
    fi
fi

echo "Ubuntu Hardening Script finished!"
echo -n "Press any button to exit."
echo
