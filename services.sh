#!/bin/bash
# Copyright (c) 2015-2016 Ben Hall
# All rights reserved.
#
# Name: ubuntu-hardening-scriptst
# Version: 1.0.3
# PLAT:  linux-64
# PLAT-Version: linux-14.04

source ~/ubuntu-hardening/readme.cfg
source scripts/apache.sh
source scripts/vsftpd.sh
source scripts/ssh.sh
source scripts/nginx.sh
source scripts/wordpress.sh
source scripts/samba.sh

function f_service {
  echo "Configuring/Uninstalling services"

  if $REQSERV='ssh'
  then
    f_ssh
  else
    sudo apt-get purge ssh
  fi

  if $REQSERV='vsftpd'
  then
    f_vsftpd
  else
    sudo apt-get purge vsftpd
  fi

  if $REQSERV='apache'
  then
    f_apache
  else
    sudo apt-get purge apache2
  fi

  if $REQSERV='pure-ftpd'
  then
    f_pureftp
  else
    sudo apt-get purge pure-ftpd
  fi

  if $REQSERV='wordpress'
  then
    f_wordpress
  else
    sudo apt-get purge wordpress
  fi

  if $REQSERV='nginx'
  then
    f_apache
  else
    sudo apt-get purge nginx
  fi

  if $REQSERV='samba'
  then
    f_samba
  else
    sudo apt-get purge samba
  fi

}
