function f_sysctl {
  echo "Configuring network settings"

  # Controls IP packet forwarding
  sudo sysctl -w net.ipv4.ip_forward=0

  # IP Spoofing protection
  sudo sysctl -w net.ipv4.conf.all.rp_filter=1
  sudo sysctl -w net.ipv4.conf.default.rp_filter=1

  # Ignore ICMP broadcast requests
  sudo sysctl -wnet.ipv4.icmp_echo_ignore_broadcasts=1

  # Disable source packet routing
  sudo sysctl -w net.ipv4.conf.all.accept_source_route=0
  sudo sysctl -w net.ipv6.conf.all.accept_source_route=0
  sudo sysctl -w net.ipv4.conf.default.accept_source_route=0
  sudo sysctl -w net.ipv6.conf.default.accept_source_route=0

  # Ignore send redirects
  sudo sysctl -w net.ipv4.conf.all.send_redirects=0
  sudo sysctl -w net.ipv4.conf.default.send_redirects=0

  # Block SYN attacks
  sudo sysctl -w net.ipv4.tcp_syncookies=1
  sudo sysctl -w net.ipv4.tcp_max_syn_backlog=2048
  sudo sysctl -w net.ipv4.tcp_synack_retries=2
  sudo sysctl -w net.ipv4.tcp_syn_retries=5

  # Log Martians
  sudo sysctl -w net.ipv4.conf.all.log_martians=1
  sudo sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1

  # Ignore ICMP redirects
  sudo sysctl -w net.ipv4.conf.all.accept_redirects=0
  sudo sysctl -w net.ipv6.conf.all.accept_redirects=0
  sudo sysctl -w net.ipv4.conf.default.accept_redirects=0
  sudo sysctl -w net.ipv6.conf.default.accept_redirects=0

  # Ignore Directed pings
  sudo sysctl -w net.ipv4.icmp_echo_ignore_all=1

  # Accept Redirects? No, this is not router
  sudo sysctl -w net.ipv4.conf.all.secure_redirects=0

  # Log packets with impossible addresses to kernel log? yes
  sudo sysctl -w net.ipv4.conf.default.secure_redirects=0

  #Enable ExecShield protection
  kernel.exec-shield=1
  kernel.randomize_va_space=1

  ########## IPv6 networking start ##############
  # Number of Router Solicitations to send until assuming no routers are present.
  # This is host and not router
  sudo sysctl -w net.ipv6.conf.default.router_solicitations=0

  # Accept Router Preference in RA?
  sudo sysctl -w net.ipv6.conf.default.accept_ra_rtr_pref=0

  # Learn Prefix Information in Router Advertisement
  sudo sysctl -w net.ipv6.conf.default.accept_ra_pinfo=0

  # Setting controls whether the system will accept Hop Limit settings from a router advertisement
  sudo sysctl -w net.ipv6.conf.default.accept_ra_defrtr=0

  #router advertisements can cause the system to assign a global unicast address to an interface
  sudo sysctl -w net.ipv6.conf.default.autoconf=0

  #how many neighbor solicitations to send out per address?
  sudo sysctl -w net.ipv6.conf.default.dad_transmits=0

  # How many global unicast IPv6 addresses can be assigned to each interface?
  sudo sysctl -w net.ipv6.conf.default.max_addresses=1

  sudo sysctl -p

}
