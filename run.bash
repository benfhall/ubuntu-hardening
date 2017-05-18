#!/bin/bash

#import functions
source ~/Desktop/ubuntu-script-cp2/modules/update

clear

#ask for functions to run
echo answer with y/n
echo -n "update?"
read updateq
clear

#call to functions
updatef
