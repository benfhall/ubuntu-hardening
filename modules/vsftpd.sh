#!/bin/bash
function vsftpdf()
{
	if echo "$vsftpdq" | grep -iq "^y" ;then
		clear

		sudo sed -i 's/#anonymous_enable=YES/anonymous_enable=YES/g' /etc/vsftpd.conf
    sudo sed -i 's/#anonymous_enable=NO/anonymous_enable=NO/g' /etc/vsftpd.conf
    sudo sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' /etc/vsftpd.conf

    sudo sed -i 's/#local_enable=YES/local_enable=YES/g' /etc/vsftpd.conf
    sudo sed -i 's/#local_enable=NO/local_enable=NO/g' /etc/vsftpd.conf
    sudo sed -i 's/local_enable=NO/local_enable=YES/g' /etc/vsftpd.conf

    sudo sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' /etc/vsftpd.conf
    sudo sed -i 's/#chroot_local_user=NO/chroot_local_user=NO/g' /etc/vsftpd.conf
		sudo sed -i 's/chroot_local_user=NO/chroot_local_user=YES/g' /etc/vsftpd.conf

    sudo sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf
    sudo sed -i 's/#write_enable=NO/write_enable=NO/g' /etc/vsftpd.conf
		sudo sed -i 's/write_enable=NO/write_enable=YES/g' /etc/vsftpd.conf

    #make user for ftp
    sudo adduser ftpuser
    sudo chown root:root /home/ftpuser
    sudo mkdir /home/ftpuser/files
    sudo chown ftpuser:ftpuser /home/ftpuser/files

    #enable SSL for vsftpd
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
    sudo sed -i 's/rsa_cert_file=/etc/ssl/private/vsftpd.pem
      rsa_cert_file=/etc/ssl/private/vsftpd.pem
      rsa_private_key_file=/etc/ssl/private/vsftpd.pem/
      ssl_enable=YES
      allow_anon_ssl=NO
      force_local_data_ssl=YES
      force_local_logins_ssl=YES
      ssl_tlsv1=YES
      ssl_sslv2=NO
      ssl_sslv3=NO
      require_ssl_reuse=NO
      ssl_ciphers=HIGH
    /g' /etc/vsftpd.conf

		sudo ufw allow vsftpd
		service vsftpd restart
		echo "hardened vsftpd security"
	else
		clear
		echo "did not harden vsftpd security"
	fi
	clear
}
