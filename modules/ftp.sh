function f_ftp {
	echo "configure vsftpd"
  sudo sed -i 's/#anonymous_enable=.*/anonymous_enable=YES/g' /etc/vsftpd.conf
  sudo sed -i 's/#anonymous_enable=.*/anonymous_enable=NO/g' /etc/vsftpd.conf
  sudo sed -i 's/anonymous_enable=.*/anonymous_enable=NO/g' /etc/vsftpd.conf
  sudo sed -i 's/#local_enable=.*/local_enable=YES/g' /etc/vsftpd.conf
  sudo sed -i 's/#local_enable=.*/local_enable=NO/g' /etc/vsftpd.conf
  sudo sed -i 's/local_enable=.*/local_enable=YES/g' /etc/vsftpd.conf
 	sudo sed -i 's/#chroot_local_user=.*/chroot_local_user=YES/g' /etc/vsftpd.conf
	sudo sed -i 's/#chroot_local_user=.*/chroot_local_user=NO/g' /etc/vsftpd.conf
	sudo sed -i 's/chroot_local_user=.*/chroot_local_user=YES/g' /etc/vsftpd.conf
	sudo sed -i 's/#write_enable=.*/write_enable=YES/g' /etc/vsftpd.conf
  sudo sed -i 's/#write_enable=.*/write_enable=NO/g' /etc/vsftpd.conf
	sudo sed -i 's/write_enable=.*/write_enable=YES/g' /etc/vsftpd.conf

	echo "allowing vsftpd through firewall"
	sudo ufw allow vsftpd
	sudo ufw allow 21
}
