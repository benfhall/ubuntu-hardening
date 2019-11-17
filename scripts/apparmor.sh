function f_apparmor {

    sudo apt-get -y install apparmor apparmor-utils
    sudo aa-enforce /etc/apparmor.d/*
    sudo service apparmor restart

}