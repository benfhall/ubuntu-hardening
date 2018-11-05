#!/bin/bash
# Copyright (c) 2015-2016 Ben Hall
# All rights reserved.
#
# Name: ubuntu-hardening-scriptst
# Version: 1.0.3
# PLAT:  linux-64
# PLAT-Version: linux-14.04

source scripts/apache.sh
source scripts/php.sh
source scripts/vsftpd.sh
source scripts/ssh.sh
source scripts/nginx.sh

function f_service {
  echo "Configuring/Uninstalling services"

  if REQSERV='ssh'
  then
    f_ssh
  else
    sudo apt-get purge openssh
  fi

  if REQSERV='vsftpd'
  then
    f_vsftpd
  else
    sudo apt-get purge vsftpd
  fi

  if REQSERV='apache'
  then
    f_apache
  else
    sudo apt-get purge apache2
  fi

}
