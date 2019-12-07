function f_ufw {

  apt-get install ufw -y
  apt-get install iptables -y

  # Accept traffic from internal interfaces
iptables -A INPUT ! -i eth0 -j ACCEPT

# Accept traffic with the ACK flag set
iptables -A INPUT -p tcp -m tcp --tcp-flags ACK ACK -j ACCEPT

# Allow incoming data that is part of a connection we established
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT

# Allow data that is related to existing connections
iptables -A INPUT -m state --state RELATED -j ACCEPT

# Accept responses to DNS queries
iptables -A INPUT -p udp -m udp --dport 1024:65535 --sport 53 -j ACCEPT

# Accept responses to our pings
iptables -A INPUT -p icmp -m icmp --icmp-type echo-reply -j ACCEPT

# Accept notifications of unreachable hosts
iptables -A INPUT -p icmp -m icmp --icmp-type destination-unreachable -j ACCEPT

# Accept notifications to reduce sending speed
iptables -A INPUT -p icmp -m icmp --icmp-type source-quench -j ACCEPT

# Accept notifications of lost packets
iptables -A INPUT -p icmp -m icmp --icmp-type time-exceeded -j ACCEPT

# Accept notifications of protocol problems
iptables -A INPUT -p icmp -m icmp --icmp-type parameter-problem -j ACCEPT

# Allow connections to our SSH server
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# Respond to pings
iptables -A INPUT -p icmp -m icmp --icmp-type echo-request -j ACCEPT

# Allow connections to webserver
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

# Allow SSL connections to webserver
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

#Allow connections to SMTP server for mail delivery
iptables -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT

iptables-save > /root/my.active.firewall.rules

}
