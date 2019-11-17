#!/bin/bash
# Copyright (c) 2015-2019 Ben Hall
# All rights reserved.
#
# Name: ubuntu-hardening
# Version: 3.0.1
# PLAT:  linux-64
# PLAT-Version: linux-14.04

sudo chmod 755 scripts -R #ensure source can access modules

source scripts/apt.sh
source scripts/ufw.sh
source scripts/users.sh
source scripts/sysctl.sh
source scripts/hosts.sh
source scripts/perm.sh
source scripts/banners.sh
source scripts/sudo.sh
source scripts/process.sh
source scripts/aide.sh
source scripts/php.sh
source scripts/apache.sh
source scripts/vsftpd.sh
source scripts/ssh.sh
source scripts/nginx.sh
source scripts/mysql.sh
source scripts/samba.sh
source scripts/pureftpd.sh
source scripts/purge.sh
source scripts/malware.sh
source scripts/filemgt.sh

echo "Ubuntu Hardening Script v.1.0.3 for Ubuntu 14.04"
echo "Created by Ben Hall"
echo "Note: Designed for CyberPatriots! Any use within the CyberPatriots competition will disqualify you!"
read -p "Press any key to continue... " -n 1
echo

read -p "Configure/Install apt? (y/N) >> " -n 1 -r input_apt
read -p "Configure the firewall? (y/N) >> " -n 1 -r input_firewall
read -p "Configure user settings? (y/N) >> " -n 1 -r input_users
if [[ $input_users =~ ^[Yy]$ ]]
then
    read -p "Input admins in README (seperate with spaces) >> " -r givenAdmins
    read -p "Input users in README (seperate with spaces) >> " -r givenUsers
    read -p "Input general password >>" -r passwd
fi
read -p "Configure hosts file? (y/N) >> " -n 1 -r input_hosts
read -p "Delete media files? (y/N) >> " -n 1 -r input_files
read -p "Configure sysctl? (y/N) >> " -n 1 -r input_sysctl
read -p "Edit banners? (y/N) >> " -n 1 -r input_banners
read -p "Configure sudo? (y/N) >> " -n 1 -r input_sudo
read -p "Harden processes? (y/N) >> " -n 1 -r input_processes
read -p "Configure AIDE? (y/N) >> " -n 1 -r input_aide
read -p "Configure permissions? (y/N) >> " -n 1 -r input_perm
read -p "Uninstall malicious software? (y/N) >> " -n 1 -r input_malware
read -p "Purge vulnerable software? (y/N) >> " -n 1 -r input_purge
read -p "Harden mysql databases? (y/N) >> " -n 1 -r input_mysql
read -p "Input critical services from README (seperate with spaces) >> " -r criticalServices

if [[ $criticalServices =~ .*ssh.* ]]
then
    echo "SSH not a critical service"
else
    read -p "Remove ssh? (y/N) >> " -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge openssh-server
    fi
fi

if [[ $criticalServices =~ .*vsftpd.* ]]
then
    echo "VSFTPD not a critical service"
else
    read -p "Remove vsftpd? (y/N) >> " -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge vsftpd
    fi
fi

if [[ $criticalServices =~ .*samba.* ]]
then
    echo "Samba not a critical service"
else
    read -p "Remove samba? (y/N) >> " -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge samba
    fi
fi

if [[ $criticalServices =~ .*nginx.* ]]
then
    echo "Nginx not a critical service"
else
    read -p "Remove nginx? (y/N) >> " -n 1 -r deletionConfirmation
    echo
    if [[ $deletionConfirmation =~ ^[Yy]$ ]]
    then
        sudo apt-get purge nginx
    fi
fi

if [[ $input_apt =~ ^[Yy]$ ]]
then
    f_apt
fi

if [[ $input_firewall =~ ^[Yy]$ ]]
then
    f_ufw
fi

if [[ $input_users =~ ^[Yy]$ ]]
then
    f_users
fi

if [[ $input_hosts =~ ^[Yy]$ ]]
then
    f_hosts
fi

if [[ $input_files =~ ^[Yy]$ ]]
then
    f_filemgt
fi

if [[ $input_sysctl =~ ^[Yy]$ ]]
then
    f_sysctl
fi

if [[ $input_banners =~ ^[Yy]$ ]]
then
    f_banners
fi

if [[ $input_sudo =~ ^[Yy]$ ]]
then
    f_sudo
fi

if [[ $input_processes =~ ^[Yy]$ ]]
then
    f_process
fi

if [[ $input_aide =~ ^[Yy]$ ]]
then
    f_aide
fi

if [[ $input_perm =~ ^[Yy]$ ]]
then
    f_perm
fi

if [[ $input_malware =~ ^[Yy]$ ]]
then
    f_malware
fi

if [[ $input_purge =~ ^[Yy]$ ]]
then
  f_purge
fi

if [[ $input_mysql =~ ^[Yy]$ ]]
then
  f_mysql
fi

if [[ $CRITICALSERVICES =~ .*ssh.* ]]
then
    f_ssh
fi

if [[ $CRITICALSERVICES =~ .*vsftpd.* ]]
then
    f_vsftpd
fi

if [[ $CRITICALSERVICES =~ .*nginx.* ]]
then
    f_nginx
fi

if [[ $CRITICALSERVICES =~ .*samba.* ]]
then
    f_samba
fi

echo "Ubuntu Hardening Script finished!"
echo -n "Press any button to exit."
echo
