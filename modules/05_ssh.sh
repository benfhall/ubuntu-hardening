function f_ssh {
  echo "allowing ssh through ufw"
  sudo ufw allow 22
  sudo ufw allow ssh

  echo "configuring ssh settings"
  sed -i '/HostKey.*ssh_host_dsa_key.*/d' /etc/ssh/sshd_config
  sed -i 's/.*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
  sed -i 's/.*LoginGraceTime.*/LoginGraceTime 20/' /etc/ssh/sshd_config
  sed -i 's/.*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  sed -i 's/.*KeyRegenerationInterval.*/KeyRegenerationInterval 1800/' /etc/ssh/sshd_config
  sed -i 's/.*UsePrivilegeSeparation.*/UsePrivilegeSeparation sandbox/' /etc/ssh/sshd_config
  sed -i 's/.*LogLevel.*/LogLevel VERBOSE/' /etc/ssh/sshd_config
  sed -i 's/.*UseLogin.*/UseLogin no/' /etc/ssh/sshd_config
  sed -i 's/.*Banner.*/Banner \/etc\/issue.net/' /etc/ssh/sshd_config
  sed -i 's/.*Subsystem sftp.*/Subsystem sftp \/usr\/lib\/ssh\/sftp-server -f AUTHPRIV -l INFO/' /etc/ssh/sshd_config
  echo "" >> /etc/ssh/sshd_config

  if ! grep -q "^AllowGroups" /etc/ssh/sshd_config 2> /dev/null; then
    echo "AllowGroups $SSH_GRPS" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^MaxAuthTries" /etc/ssh/sshd_config 2> /dev/null; then
    echo "MaxAuthTries 2" >> /etc/ssh/sshd_config
    else
    sed -i 's/MaxAuthTries.*/MaxAuthTries 2/' /etc/ssh/sshd_config
  fi

  if ! grep -q "^ClientAliveInterval" /etc/ssh/sshd_config 2> /dev/null; then
    echo "ClientAliveInterval 300" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^ClientAliveCountMax" /etc/ssh/sshd_config 2> /dev/null; then
    echo "ClientAliveCountMax 0" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^PermitUserEnvironment" /etc/ssh/sshd_config 2> /dev/null; then
    echo "PermitUserEnvironment no" >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^KexAlgorithms" /etc/ssh/sshd_config 2> /dev/null; then
    echo 'KexAlgorithms curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256' >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^Ciphers" /etc/ssh/sshd_config 2> /dev/null; then
    echo 'Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes256-ctr' >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^Macs" /etc/ssh/sshd_config 2> /dev/null; then
    echo 'Macs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256' >> /etc/ssh/sshd_config
  fi

  if ! grep -q "^MaxSessions" /etc/ssh/sshd_config 2> /dev/null; then
    echo "MaxSessions 2" >> /etc/ssh/sshd_config
    else
    sed -i 's/MaxSessions.*/MaxSessions 2/' /etc/ssh/sshd_config
  fi

  if ! grep -q "^UseDNS" /etc/ssh/sshd_config 2> /dev/null; then
    echo "UseDNS yes" >> /etc/ssh/sshd_config
    else
    sed -i 's/UseDNS.*/UseDNS yes/' /etc/ssh/sshd_config
  fi

  service restart sshd
  service restart ssh
}
