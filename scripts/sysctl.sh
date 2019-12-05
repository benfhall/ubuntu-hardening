function f_sysctl {

  apt-get install tcpd -y

  # Controls IP packet forwarding
  sysctl -w net.ipv4.ip_forward=0

  # IP Spoofing protection
  sysctl -w net.ipv4.conf.all.rp_filter=1
  sysctl -w net.ipv4.conf.default.rp_filter=1

  # Ignore ICMP broadcast requests
  sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1

  # Disable source packet routing
  sysctl -w net.ipv4.conf.all.accept_source_route=0
  sysctl -w net.ipv6.conf.all.accept_source_route=0
  sysctl -w net.ipv4.conf.default.accept_source_route=0
  sysctl -w net.ipv6.conf.default.accept_source_route=0

  # Ignore send redirects
  sysctl -w net.ipv4.conf.all.send_redirects=0
  sysctl -w net.ipv4.conf.default.send_redirects=0

  # Block SYN attacks
  sysctl -w net.ipv4.tcp_syncookies=1
  sysctl -w net.ipv4.tcp_max_syn_backlog=2048
  sysctl -w net.ipv4.tcp_synack_retries=2
  sysctl -w net.ipv4.tcp_syn_retries=5

  # Log Martians
  sysctl -w net.ipv4.conf.all.log_martians=1
  sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1

  # Ignore ICMP redirects
  sysctl -w net.ipv4.conf.all.accept_redirects=0
  sysctl -w net.ipv6.conf.all.accept_redirects=0
  sysctl -w net.ipv4.conf.default.accept_redirects=0
  sysctl -w net.ipv6.conf.default.accept_redirects=0

  # Ignore Directed pings
  sysctl -w net.ipv4.icmp_echo_ignore_all=1

  # Accept Redirects? No, this is not router
  sysctl -w net.ipv4.conf.all.secure_redirects=0

  # Log packets with impossible addresses to kernel log? yes
  sysctl -w net.ipv4.conf.default.secure_redirects=0

  ########## IPv6 networking start ##############
  # Number of Router Solicitations to send until assuming no routers are present.
  # This is host and not router
  sysctl -w net.ipv6.conf.default.router_solicitations=0

  # Accept Router Preference in RA?
  sysctl -w net.ipv6.conf.default.accept_ra_rtr_pref=0

  # Learn Prefix Information in Router Advertisement
  sysctl -w net.ipv6.conf.default.accept_ra_pinfo=0

  # Setting controls whether the system will accept Hop Limit settings from a router advertisement
  sysctl -w net.ipv6.conf.default.accept_ra_defrtr=0

  #router advertisements can cause the system to assign a global unicast address to an interface
  sysctl -w net.ipv6.conf.default.autoconf=0

  #how many neighbor solicitations to send out per address?
  sysctl -w net.ipv6.conf.default.dad_transmits=0

  # How many global unicast IPv6 addresses can be assigned to each interface?
  sysctl -w net.ipv6.conf.default.max_addresses=1
  
  sysctl -w kernel.randomize_va_space=2

  sysctl -p

}
