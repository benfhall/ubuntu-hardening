function f_apt {
  sudo echo "Configuring apt"

  if ! grep '^Acquire::http::AllowRedirect' /etc/apt/apt.conf.d/* ; then
    sudo echo 'Acquire::http::AllowRedirect "false";' >> /etc/apt/apt.conf.d/01-vendor-ubuntu
  else
    sudo sed -i 's/.*Acquire::http::AllowRedirect*/Acquire::http::AllowRedirect "false";/g' "$(grep -l 'Acquire::http::AllowRedirect' /etc/apt/apt.conf.d/*)"
  fi

  if ! grep '^APT::Get::AllowUnauthenticated' /etc/apt/apt.conf.d/* ; then
    sudo echo 'APT::Get::AllowUnauthenticated "false";' >> /etc/apt/apt.conf.d/01-vendor-ubuntu
  else
    sudo sed -i 's/.*APT::Get::AllowUnauthenticated.*/APT::Get::AllowUnauthenticated "false";/g' "$(grep -l 'APT::Get::AllowUnauthenticated' /etc/apt/apt.conf.d/*)"
  fi

  if ! grep '^APT::Periodic::AutocleanInterval "7";' /etc/apt/apt.conf.d/*; then
    sudo echo 'APT::Periodic::AutocleanInterval "7";' >> /etc/apt/apt.conf.d/10periodic
  else
    sudo sed -i 's/.*APT::Periodic::AutocleanInterval.*/APT::Periodic::AutocleanInterval "7";/g' "$(grep -l 'APT::Periodic::AutocleanInterval' /etc/apt/apt.conf.d/*)"
  fi

  if ! grep '^APT::Install-Recommends' /etc/apt/apt.conf.d/*; then
    sudo echo 'APT::Install-Recommends "false";' >> /etc/apt/apt.conf.d/01-vendor-ubuntu
  else
    sudo sed -i 's/.*APT::Install-Recommends.*/APT::Install-Recommends "false";/g' "$(grep -l 'APT::Install-Recommends' /etc/apt/apt.conf.d/*)"
  fi

  if ! grep '^APT::Get::AutomaticRemove' /etc/apt/apt.conf.d/*; then
    sudo echo 'APT::Get::AutomaticRemove "true";' >> /etc/apt/apt.conf.d/01-vendor-ubuntu
  else
    sudo sed -i 's/.*APT::Get::AutomaticRemove.*/APT::Get::AutomaticRemove "true";/g' "$(grep -l 'APT::Get::AutomaticRemove' /etc/apt/apt.conf.d/*)"
  fi

  if ! grep '^APT::Install-Suggests' /etc/apt/apt.conf.d/*; then
    sudo echo 'APT::Install-Suggests "false";' >> /etc/apt/apt.conf.d/01-vendor-ubuntu
  else
    sudo sed -i 's/.*APT::Install-Suggests.*/APT::Install-Suggests "false";/g' "$(grep -l 'APT::Install-Suggests' /etc/apt/apt.conf.d/*)"
  fi

  if ! grep '^Unattended-Upgrade::Remove-Unusudo sed-Dependencies' /etc/apt/apt.conf.d/*; then
    sudo echo 'Unattended-Upgrade::Remove-Unusudo sed-Dependencies "true";' >> /etc/apt/apt.conf.d/50unattended-upgrades
  else
    sudo sed -i 's/.*Unattended-Upgrade::Remove-Unusudo sed-Dependencies.*/Unattended-Upgrade::Remove-Unusudo sed-Dependencies "true";/g' "$(grep -l 'Unattended-Upgrade::Remove-Unusudo sed-Dependencies' /etc/apt/apt.conf.d/*)"
  fi
  if ! grep 'mount.* /tmp' /etc/apt/apt.conf.d/* ; then
    sudo echo 'DPkg::Pre-Invoke {"mount -o remount,exec,nodev,nosuid /tmp";};' >> /etc/apt/apt.conf.d/99noexec-tmp
    sudo echo 'DPkg::Post-Invoke {"mount -o remount,mode=1777,strictatime,noexec,nodev,nosuid /tmp";};' >> /etc/apt/apt.conf.d/99noexec-tmp
  fi

  if ! grep 'mount.* /var/tmp' /etc/apt/apt.conf.d/* ; then
    sudo echo 'DPkg::Pre-Invoke {"mount -o remount,exec,nodev,nosuid /var/tmp";};' >> /etc/apt/apt.conf.d/99noexec-tmp
    sudo echo 'DPkg::Post-Invoke {"mount -o remount,mode=1777,strictatime,noexec,nodev,nosuid /var/tmp";};' >> /etc/apt/apt.conf.d/99noexec-tmp
  fi
  
  sudo apt-get update

}
