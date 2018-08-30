function f_ssh {
  echo "Configuring ssh"

  sudo sed -i 's/.*PermitRootLogin.*//' /etc/ssh/sshd_config
  sudo echo "PermitRootLogin no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*PermitEmptyPasswords.*//' /etc/ssh/sshd_config
  sudo echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*PermitUserEnvironment.*//' /etc/ssh/sshd_config
  sudo echo "PermitUserEnvironment no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*PrintLastLog.*//' /etc/ssh/sshd_config
  sudo echo "PrintLastLog no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*ListenAddress.*//' /etc/ssh/sshd_config
  sudo echo "ListenAddress 1.1.1.1" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*PasswordAuthentication.*//' /etc/ssh/sshd_config
  sudo echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*Protocol.*//' /etc/ssh/sshd_config
  sudo echo "Protocol 2" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*UseDNS.*//' /etc/ssh/sshd_config
  sudo echo "UseDNS no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*ClientAliveInterval.*//' /etc/ssh/sshd_config
  sudo echo "ClientAliveInterval 300" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*ClientAliveCountMax.*//' /etc/ssh/sshd_config
  sudo echo "ClientAliveCountMax 0" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*IgnoreRhosts.*//' /etc/ssh/_sshd_config
  sudo echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*RhostsAuthentication.*//' /etc/ssh/_sshd_config
  sudo echo "RhostsAuthentication no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*RhostsRSAAuthentication.*//' /etc/ssh/_sshd_config
  sudo echo "RhostsRSAAuthentication no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*RSAAuthentication.*//' /etc/ssh/_sshd_config
  sudo echo "RSAAuthentication yes" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*HostbasedAuthentication.*//' /etc/ssh/_sshd_config
  sudo echo "HostbasedAuthentication no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*LoginGraceTime.*//' /etc/ssh/sshd_config
  sudo echo "LoginGraceTime 20" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*X11Forwarding.*//' /etc/ssh/sshd_config
  sudo echo "X11Forwarding yes" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*AllowTcpForwarding.*//' /etc/ssh/sshd_config
  sudo echo "AllowTcpForwarding no" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*LogLevel.*//' /etc/ssh/sshd_config
  sudo echo "LogLevel VERBOSE" >> /etc/ssh/sshd_config
  sudo sed -i 's/.*StrictModes.*//' /etc/ssh/sshd_config
  sudo echo "StrictModes yes" >> /etc/ssh/sshd_config
  sudo sed -i "s/#MaxAuthTries 6//" /etc/ssh/sshd_config
  sudo echo "MaxAuthTries 3" >> /etc/ssh/sshd_config
  sudo sed -i "s/#Port 22/Port 6211/g" /etc/ssh/sshd_config


  sudo iptables -I INPUT -p tcp --dport 6211 -i eth0 -m state --state NEW -m recent --set
  sudo iptables -I INPUT -p tcp --dport 6211 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 5 -j DROP
  iptables-save > /root/my.active.firewall.rules

  sudo service enable ssh
  sudo service restart ssh

}