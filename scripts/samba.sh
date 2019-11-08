function f_samba {
    echo "Configuring Samba"

    sudo echo "hosts allow = 127.0.0.1" >> /etc/samba/smb.conf
    sudo echo "hosts deny = 0.0.0.0/0" >> /etc/samba/smb.conf
    sudo echo "interfaces = eth* lo" >> /etc/samba/smb.conf
    sudo echo "bind interfaces only = yes" >> /etc/samba/smb.conf
    sudo ufw allow samba
    
}