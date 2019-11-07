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

read -p "Configure SSH" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_ssh
  else
    sudo apt-get purge openssh-server
fi

read -p "Configure vsFTPd" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_vsftpd
  else
    sudo apt-get purge vsftpd
fi

read -p "Configure pure-ftpd?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_pureftpd
  else
    sudo apt-get purge pure-ftpd
fi

read -p "Configure samba?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_samba
  else
    sudo apt-get purge samba
fi

read -p "Configure Apache?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    f_apache
  else
    sudo apt-get purge apache2
fi

read -p "Uninstall nginx?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get purge nginx
fi

read -p "Uninstall bind9?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get purge bind9
fi

read -p "Uninstall postfix?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get purge postfix
fi

read -p "Purge vulnerable software??" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  f_purge
fi


echo "Ubuntu Hardening Script finished!"
echo -n "Press any button to exit."
echo
