#!/bin/bash

#import functions
source ~/ubuntu-hardening-script-master/modules/update.sh
source ~/ubuntu-hardening-script-master/modules/scan.sh
source ~/ubuntu-hardening-script-master/modules/install.sh
source ~/ubuntu-hardening-script-master/modules/ssh.sh
source ~/ubuntu-hardening-script-master/modules/firewall.sh
source ~/ubuntu-hardening-script-master/modules/wireless.sh

clear

#ask for modules
echo answer with y/n
echo -n "install necessary programs?"
read installq
clear

echo answer with y/n
echo -n "update?"
read updateq
clear

echo answer with y/n
echo -n "enable/configure firewall?"
read ufwq
clear

echo answer with y/n
echo -n "configure wireless?"
read wirelessq
clear

echo answer with y/n
echo -n "scan?"
read scanq
clear

echo answer with y/n
echo -n "secure ssh?"
read sshq
clear

#call to functions
installf
updatef
ufwf
wirelessf
scanf
sshf
