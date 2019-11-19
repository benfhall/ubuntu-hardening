#!/bin/bash
# Copyright (c) 2015-2019 Ben Hall
# All rights reserved.
#
# Name: ubuntu-hardening
# Version: 3.0.1
# PLAT:  linux-64
# PLAT-Version: linux-14.04

chmod 755 scripts -R #ensure source can access modules

source scripts/apt.sh
source scripts/ufw.sh
source scripts/users.sh
source scripts/sysctl.sh
source scripts/hosts.sh
source scripts/perm.sh
source scripts/banners.sh
source scripts/sudo.sh
source scripts/process.sh
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
source scripts/apparmor.sh
source scripts/cron.sh
source scripts/audit.sh

clear
echo "Ubuntu Hardening Script v.1.0.3 for Ubuntu 14.04 and 16.04"
echo "Created by Ben Hall"
echo "Note: Designed for CyberPatriots! Any use within the CyberPatriots competition will disqualify you!"

version=$(lsb_release -a) 

if [[ $version =~ .*14.04* ]]
then
    echo "RUNNING 14.04 SCRIPT"
else
    if [[ $version =~ .*16.04* ]]
    then
        echo "RUNNING 16.04 SCRIPT"
    else
        echo "UNKNOWN VERSION! ENDING SCRIPT"
        exit
    fi
fi

read -p "Press any key to continue... " -n 1
echo

clear
read -p "Keep backup file of scoring report? (y/N) >> " -n 1 -r input_backup
echo

if [[ $input_backup =~ ^[Yy]$ ]]
then
    read -p "What is the location of the scoring report? (y/N) >> " -r backup_location
    echo
    crontab -e */5 * * * * cp -f $backup_location scoring_report.log
fi

clear
read -p "Configure/Install apt? (y/N) >> " -n 1 -r input_apt
echo
clear
read -p "Configure the firewall? (y/N) >> " -n 1 -r input_firewall
echo
clear
read -p "Configure user settings? (y/N) >> " -n 1 -r input_users
echo
if [[ $input_users =~ ^[Yy]$ ]]
then
    read -p "Input admins in README (seperate with spaces) >> " -r givenAdmins
    echo
    read -p "Input users in README (seperate with spaces) >> " -r givenUsers
    echo
    read -p "Input general password >>" -r passwd
    echo
fi
clear
read -p "Configure hosts file? (y/N) >> " -n 1 -r input_hosts
echo
clear
read -p "Delete media files? (y/N) >> " -n 1 -r input_files
echo
clear
read -p "Configure sysctl? (y/N) >> " -n 1 -r input_sysctl
echo
clear
read -p "Edit banners? (y/N) >> " -n 1 -r input_banners
echo
clear
read -p "Configure sudo? (y/N) >> " -n 1 -r input_sudo
echo
clear
read -p "Harden processes? (y/N) >> " -n 1 -r input_processes
echo
clear
read -p "Configure permissions? (y/N) >> " -n 1 -r input_perm
echo
clear
read -p "Uninstall malicious software? (y/N) >> " -n 1 -r input_malware
echo
clear
read -p "Purge vulnerable software? (y/N) >> " -n 1 -r input_purge
echo
clear
read -p "Harden mysql databases? (y/N) >> " -n 1 -r input_mysql
echo
clear
read -p "Configure cron? (y/N) >> " -n 1 -r input_cron
echo
clear
read -p "Configure apparmor? (y/N) >> " -n 1 -r input_apparmor
echo
clear
read -p "Configure audit? (y/N) >> " -n 1 -r input_caudit
echo
clear
read -p "Harden critical services? (y/N) >> " -n 1 -r input_services
echo
if [[ $input_services =~ ^[Yy]$ ]]
then
    read -p "Input critical services from README (seperate with spaces) >> " -r criticalServices
    echo
fi
clear

if [[ $criticalServices =~ .*ssh.* ]]
then
    echo "SSH is identified as a critical service and will not be uninstalled"
else
    if [[ $(apt-cache policy openssh-server) =~ .*"Installed: (none)".* ]]
    then
        echo "SSH is not currently installed and is not a critical service."
    else
        read -p "Remove ssh? (y/N) >> " -n 1 -r deletionConfirmation
        echo
        if [[ $deletionConfirmation =~ ^[Yy]$ ]]
        then
            apt-get purge openssh-server -y > /dev/null 2>&1
            echo "SSH has been purged."
        fi
    fi
fi

echo

if [[ $criticalServices =~ .*vsftpd.* ]]
then
    echo "vsFTPd is identified as a critical service and will not be uninstalled"
else
    if [[ $(apt-cache policy vsftpd) =~ .*"Installed: (none)".* ]]
    then
        echo "vsFTPd is not currently installed and is not a critical service."
    else
        read -p "Remove vsftpd? (y/N) >> " -n 1 -r deletionConfirmation
        echo
        if [[ $deletionConfirmation =~ ^[Yy]$ ]]
        then
            apt-get purge vsftpd -y > /dev/null 2>&1
            echo "vsFTPd has been purged."
        fi
    fi
fi

echo

if [[ $criticalServices =~ .*samba.* ]]
then
    echo "Samba is identified as a critical service and will not be uninstalled"
else
    if [[ $(apt-cache policy samba) =~ .*"Installed: (none)".* ]]
    then
        echo "Samba is not currently installed and is not a critical service."
    else
        read -p "Remove samba? (y/N) >> " -n 1 -r deletionConfirmation
        echo
        if [[ $deletionConfirmation =~ ^[Yy]$ ]]
        then
            apt-get purge samba -y > /dev/null 2>&1
            echo "Samba has been purged."
        fi
    fi
fi

echo

if [[ $criticalServices =~ .*nginx.* ]]
then
    echo "Nginx is identified as a critical service and will not be uninstalled"
else
    if [[ $(apt-cache policy nginx) =~ .*"Installed: (none)".* ]]
    then
        echo "Nginx is not currently installed and is not a critical service."
    else
        read -p "Remove nginx? (y/N) >> " -n 1 -r deletionConfirmation
        echo
        if [[ $deletionConfirmation =~ ^[Yy]$ ]]
        then
            apt-get purge nginx -y > /dev/null 2>&1
            echo "Nginx has been purged."
        fi
    fi
fi

echo

if [[ $criticalServices =~ .*pureftpd.* ]]
then
    echo "pureftpd is identified as a critical service and will not be uninstalled"
else
    if [[ $(apt-cache policy pure-ftpd) =~ .*"Installed: (none)".* ]]
    then
        echo "pureftpd is not currently installed and is not a critical service."
    else
        read -p "Remove pureftpd? (y/N) >> " -n 1 -r deletionConfirmation
        echo
        if [[ $deletionConfirmation =~ ^[Yy]$ ]]
        then
            apt-get purge pure-ftpd -y > /dev/null 2>&1
            echo "pureftpd has been purged."
        fi
    fi
fi

echo

if [[ $input_apt =~ ^[Yy]$ ]]
then
    echo -ne "Configuring apt... \r"
    f_apt > /dev/null 2>&1
    echo -e "Configuring apt... [COMPLETE]"
fi

echo

if [[ $input_firewall =~ ^[Yy]$ ]]
then
    echo "Configuring ufw... "
    f_ufw
    echo "Configuring ufw... [COMPLETE]"
fi

echo

if [[ $input_users =~ ^[Yy]$ ]]
then
    echo "Configuring account settings... "
    f_users
    echo "Configuring account settings... [COMPLETE]"
fi

echo

if [[ $input_hosts =~ ^[Yy]$ ]]
then
    echo -ne "Configuring hosts file... \r"
    f_hosts > /dev/null 2>&1
    echo -e "Configuring hosts file... [COMPLETE]"
fi

echo

if [[ $input_files =~ ^[Yy]$ ]]
then
    echo -ne "Removing media files... \r"
    f_filemgt > /dev/null 2>&1
    echo -e "Removing media files... [COMPLETE]"
fi

echo

if [[ $input_sysctl =~ ^[Yy]$ ]]
then
    echo -ne "Configuring network settings... \r"
    f_sysctl > /dev/null 2>&1
    echo -e "Configuring network settings... [COMPLETE]"
fi

echo

if [[ $input_banners =~ ^[Yy]$ ]]
then
    echo -ne "Configuring banners... \r"
    f_banners > /dev/null 2>&1
    echo -n "Configuring banners... [COMPLETE]"
fi

echo

if [[ $input_sudo =~ ^[Yy]$ ]]
then
    echo -ne "Configuring sudo... \r"
    f_sudo > /dev/null 2>&1
    echo -n "Configuring sudo... [COMPLETE]"
fi

echo

if [[ $input_processes =~ ^[Yy]$ ]]
then
    echo -ne "Hardening processes... \r"
    f_process > /dev/null 2>&1
    echo -n "Hardening processes... [COMPLETE]"
fi

echo

if [[ $input_aide =~ ^[Yy]$ ]]
then
    echo -ne "Configuring aide... \r"
    f_aide > /dev/null 2>&1
    echo -n "Configuring aide... [COMPLETE]"
fi

echo

if [[ $input_perm =~ ^[Yy]$ ]]
then
    echo -ne "Configuring permissions... \r"
    f_perm > /dev/null 2>&1
    echo -n "Configuring permissions... [COMPLETE]"
fi

echo

if [[ $input_malware =~ ^[Yy]$ ]]
then
    echo -ne "Removing potential malware... \r"
    f_malware > /dev/null 2>&1
    echo -n "Removing potential malware... [COMPLETE]"
fi

echo

if [[ $input_purge =~ ^[Yy]$ ]]
then
    echo -ne "Purging non-server applications... \r"
    f_purge > /dev/null 2>&1
    echo -n "Purging non-server applications... [COMPLETE]"
fi

echo

if [[ $input_mysql =~ ^[Yy]$ ]]
then
    echo -ne "Configuring mysql databases... \r"
    f_mysql > /dev/null 2>&1

    if [[ $version =~ .*14.04* ]]
    then
        sudo service mysql stop
        sudo service mysql start
    else
        if [[ $version =~ .*16.04* ]]
        then
            sudo systemctl enable mysql.service
            sudo systemctl reload-or-restart mysql.service
        fi
    fi

    echo -n "Configuring mysql databases... [COMPLETE]"

fi

echo

if [[ $CRITICALSERVICES =~ .*ssh.* ]]
then
    echo -ne "Configuring ssh... \r"
    f_ssh > /dev/null 2>&1

    if [[ $version =~ .*14.04* ]]
    then
        sudo service ssh stop
        sudo service ssh start
    else
        if [[ $version =~ .*16.04* ]]
        then
            sudo systemctl enable ssh.service
            sudo systemctl reload-or-restart ssh.service
            sudo systemctl enable sshd.service
            sudo systemctl reload-or-restart sshd.service
        fi
    fi

    echo -n "Configuring ssh... [COMPLETE]"
    
fi

echo

if [[ $CRITICALSERVICES =~ .*vsftpd.* ]]
then
    echo -ne "Configuring vsftpd... \r"
    f_vsftpd > /dev/null 2>&1

    if [[ $version =~ .*14.04* ]]
    then
        sudo service vsftpd stop
        sudo service vsftpd start
    else
        if [[ $version =~ .*16.04* ]]
        then
            sudo systemctl enable vsftpd.service
            sudo systemctl reload-or-restart vsftpd.service
        fi
    fi

    echo -n "Configuring vsftpd... [COMPLETE]"
fi

echo

if [[ $CRITICALSERVICES =~ .*nginx.* ]]
then
    echo -ne "Configuring nginx... \r"
    f_nginx > /dev/null 2>&1

    if [[ $version =~ .*14.04* ]]
    then
        sudo service nginx stop
        sudo service nginx start
    else
        if [[ $version =~ .*16.04* ]]
        then
            sudo systemctl enable nginx.service
            sudo systemctl reload-or-restart nginx.service
        fi
    fi

    echo -n "Configuring nginx... [COMPLETE]"
fi

echo

if [[ $CRITICALSERVICES =~ .*samba.* ]]
then
    echo -ne "Configuring samba... \r"
    f_samba > /dev/null 2>&1

    if [[ $version =~ .*14.04* ]]
    then
        sudo service samba stop
        sudo service samba start
    else
        if [[ $version =~ .*16.04* ]]
        then
            sudo systemctl enable samba.service
            sudo systemctl reload-or-restart samba.service
        fi
    fi

    echo -n "Configuring samba... [COMPLETE]"
fi

if [[ $CRITICALSERVICES =~ .*pureftpd.* ]]
then
    echo -ne "Configuring pureftpd... \r"
    f_pureftpd > /dev/null 2>&1

    if [[ $version =~ .*14.04* ]]
    then
        sudo service pure-ftpd stop
        sudo service pure-ftpd start
    else
        if [[ $version =~ .*16.04* ]]
        then
            sudo systemctl enable pure-ftpd.service
            sudo systemctl reload-or-restart pure-ftpd.service
        fi
    fi

    echo -n "Configuring pureftpd... [COMPLETE]"
fi

if [[ $input_apparmor =~ ^[Yy]$ ]]
then
    echo -ne "Configuring apparmor... \r"
    f_apparmor > /dev/null 2>&1

    if [[ $version =~ .*14.04* ]]
    then
        sudo service apparmor stop
        sudo service apparmor start
    else
        if [[ $version =~ .*16.04* ]]
        then
            sudo systemctl enable apparmor.service
            sudo systemctl reload-or-restart apparmor.service
        fi
    fi

    echo -n "Configuring apparmor... [COMPLETE]"
fi

if [[ $input_cron =~ ^[Yy]$ ]]
then
    echo -ne "Configuring cron... \r"
    f_cron > /dev/null 2>&1
    echo -n "Configuring cron... [COMPLETE]"
fi

if [[ $input_audit =~ ^[Yy]$ ]]
then
    echo -ne "Configuring audit... \r"
    f_audit > /dev/null 2>&1
    echo -n "Configuring audit... [COMPLETE]"
fi




echo "Ubuntu Hardening Script finished!"
echo -n "Press any button to exit."
echo
