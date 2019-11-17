function f_apparmor {

    apt-get -y install apparmor apparmor-utils
    aa-enforce /etc/apparmor.d/*
    service apparmor restart

}