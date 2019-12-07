function f_samba {

    apt-get install samba  -y

    #grep -q '^hosts allow' /etc/samba/smb.conf && sed -i 's/^hosts allow.*/hosts allow = 127.0.0.1 192.168.2.0\/24 192.168.3.0\/24\/' /etc/samba/smb.conf || echo 'hosts allow = 127.0.0.1 192.168.2.0/24 192.168.3.0/24' >> /etc/samba/smb.conf
    #grep -q '^hosts deny' /etc/samba/smb.conf && sed -i 's/^hosts deny.*/hosts deny = 0.0.0.0\/0/' /etc/samba/smb.conf || echo 'hosts deny = 0.0.0.0/0' >> /etc/samba/smb.conf
    grep -q '^interfaces' /etc/samba/smb.conf && sed -i 's/^interfaces.*/interfaces = eth* lo' /etc/samba/smb.conf || echo 'interfaces = eth* lo' >> /etc/samba/smb.conf
    grep -q '^bind interfaces only' /etc/samba/smb.conf && sed -i 's/^bind interfaces only.*/bind interfaces only/' /etc/samba/smb.conf || echo 'bind interfaces only' >> /etc/samba/smb.conf
    grep -q '^guest ok' /etc/samba/smb.conf && sed -i 's/^guest ok.*/guest ok = yes/' /etc/samba/smb.conf || echo 'guest ok = yes' >> /etc/samba/smb.conf
    grep -q '^restrict anonymous' /etc/samba/smb.conf && sed -i 's/^restrict anonymous.*/restrict anonymous = 2/' /etc/samba/smb.conf || echo 'restrict anonymous = 2' >> /etc/samba/smb.conf
    grep -q '^encrypt passwords' /etc/samba/smb.conf && sed -i 's/^encrypt passwords.*/encrypt passwords = yes/' /etc/samba/smb.conf || echo 'encrypt passwords = yes' >> /etc/samba/smb.conf

    ufw allow samba

}
