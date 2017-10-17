function f_vsftpd {
	echo "[$i] configure vsftpd"
  		sed -i 's/#anonymous_enable=YES/anonymous_enable=YES/g' /etc/vsftpd.conf
  		sed -i 's/#anonymous_enable=NO/anonymous_enable=NO/g' /etc/vsftpd.conf
  		sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' /etc/vsftpd.conf
  		sed -i 's/#local_enable=YES/local_enable=YES/g' /etc/vsftpd.conf
  		sed -i 's/#local_enable=NO/local_enable=NO/g' /etc/vsftpd.conf
  		sed -i 's/local_enable=NO/local_enable=YES/g' /etc/vsftpd.conf
 		sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' /etc/vsftpd.conf
		sed -i 's/#chroot_local_user=NO/chroot_local_user=NO/g' /etc/vsftpd.conf
		sed -i 's/chroot_local_user=NO/chroot_local_user=YES/g' /etc/vsftpd.conf
		sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf
  		sed -i 's/#write_enable=NO/write_enable=NO/g' /etc/vsftpd.conf
		sed -i 's/write_enable=NO/write_enable=YES/g' /etc/vsftpd.conf
		sudo ufw allow vsftpd
		sudo ufw allow 21
  ((i++))
  fi
}
