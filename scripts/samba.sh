function f_samba {

    apt-get install samba  -y

    echo "hosts allow = 127.0.0.1 192.168.2.0/24 192.168.3.0/24" >> /etc/samba/smb.conf
    echo "hosts deny = 0.0.0.0/0" >> /etc/samba/smb.conf
    echo "interfaces = eth* lo" >> /etc/samba/smb.conf
    echo "bind interfaces only = yes" >> /etc/samba/smb.conf
    echo "guest ok = no" >> /etc/samba/smb.conf
    echo 'restrict anonymous = 2' >> /etc/samba/smb.conf
    echo 'encrypt passwords = yes' >> /etc/samba/smb.conf

    ufw allow samba

}
