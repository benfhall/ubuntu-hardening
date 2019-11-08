function f_ssh {
  sudo echo "Configuring ssh"

  sudo sed -i '/HostKey.*ssh_host_dsa_key.*/d' /etc/ssh/sshd_config
  sudo sed -i '/KeyRegenerationInterval.*/d' /etc/ssh/sshd_config
  sudo sed -i '/ServerKeyBits.*/d' /etc/ssh/sshd_config
  sudo sed -i '/UseLogin.*/d' /etc/ssh/sshd_config
  sudo sed -i 's/.*X11Forwarding.*/X11Forwarding no/' /etc/ssh/sshd_config
  sudo sed -i 's/.*LoginGraceTime.*/LoginGraceTime 20/' /etc/ssh/sshd_config
  sudo sed -i 's/.*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  sudo sed -i 's/.*UsePrivilegeSeparation.*/UsePrivilegeSeparation sandbox/' /etc/ssh/sshd_config
  sudo sed -i 's/.*LogLevel.*/LogLevel VERBOSE/' /etc/ssh/sshd_config
  sudo sed -i 's/.*Banner.*/Banner \/etc\/issue.net/' /etc/ssh/sshd_config
  sudo sed -i 's/.*Subsystem.*sftp.*/Subsystem sftp internal-sftp/' /etc/ssh/sshd_config
  sudo sed -i 's/^#.*Compression.*/Compression no/' /etc/ssh/sshd_config
  sudo sed -i "s/.*Port.*/Port $SSH_PORT/" /etc/ssh/sshd_config

  sudo echo "" >> /etc/ssh/sshd_config

  if ! grep -q "^LogLevel" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "LogLevel VERBOSE" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^PrintLastLog" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "PrintLastLog yes" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^IgnoreUserKnownHosts" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "IgnoreUserKnownHosts yes" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^PermitEmptyPasswords" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^AllowGroups" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "AllowGroups $SSH_GRPS" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^MaxAuthTries" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "MaxAuthTries 2" >> /etc/ssh/sshd_config
  else
    sudo sed -i 's/MaxAuthTries.*/MaxAuthTries 2/' /etc/ssh/sshd_config
  fi

  if ! grep -q "^ClientAliveInterval" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "ClientAliveInterval 300" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^ClientAliveCountMax" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "ClientAliveCountMax 0" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^PermitUserEnvironment" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "PermitUserEnvironment no" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^KexAlgorithms" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo 'KexAlgorithms curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256' >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^Ciphers" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo 'Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes256-ctr' >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^Macs" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo 'Macs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256' >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^MaxSessions" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "MaxSessions 2" >> /etc/ssh/sshd_config
  else
    sudo sed -i 's/MaxSessions.*/MaxSessions 2/' /etc/ssh/sshd_config
  fi

  if ! grep -q "^UseDNS" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "UseDNS no" >> /etc/ssh/sshd_config
  else
    sudo sed -i 's/UseDNS.*/Usudo sedNS no/' /etc/ssh/sshd_config
  fi

  if ! grep -q "^StrictModes" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "StrictModes yes" >> /etc/ssh/sshd_config
  else
    sudo sed -i 's/StrictModes.*/StrictModes yes/' /etc/ssh/sshd_config
  fi

  if ! grep -q "^MaxStartups" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "MaxStartups 10:30:60" >> /etc/ssh/sshd_config
  else
    sudo sed -i 's/MaxStartups.*/MaxStartups 10:30:60/' /etc/ssh/sshd_config
  fi

  if ! grep -q "^HostbasedAuthentication" /etc/ssh/sshd_config 2> /dev/null; then
    sudo echo "HostbasedAuthentication no" >> /etc/ssh/sshd_config
  else
    sudo sed -i 's/HostbasedAuthentication.*/HostbasedAuthentication no/' /etc/ssh/sshd_config
  fi

  sudo cp /etc/ssh/sshd_config "/etc/ssh/sshd_config.$(date +%y%m%d)"
  sudo grep -v '#' "/etc/ssh/sshd_config.$(date +%y%m%d)" | sort | uniq > /etc/ssh/sshd_config
  sudo rm "/etc/ssh/sshd_config.$(date +%y%m%d)"

  chown root:root /etc/ssh/sshd_config
  chmod 0600 /etc/ssh/sshd_config

  sudo systemctl restart sshd.service

  sudo ufw allow ssh
  sudo ufw allow 22

  sudo service ssh enable
  sudo service ssh restart
}
