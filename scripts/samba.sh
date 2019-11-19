function f_samba {

    apt-get install samba  -y

    echo "hosts allow = 127.0.0.1" >> /etc/samba/smb.conf
    echo "hosts deny = 0.0.0.0/0" >> /etc/samba/smb.conf
    echo "interfaces = eth* lo" >> /etc/samba/smb.conf
    echo "bind interfaces only = yes" >> /etc/samba/smb.conf

    ufw allow samba

}