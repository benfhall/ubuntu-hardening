#!/bin/bash
function wirelessf()
{
	if echo "$wirelessq" | grep -iq "^y" ;then
		clear

    sudo rm -rf etc/NetworkManager/system-connections/ && mkdir etc/NetworkManager/system-connections/
    sudo echo "nospoof on" >> /etc/host.conf

		sudo echo "#Added by Swidex's Security Script
		net.ipv4.icmp_echo_ignore_broadcasts = 1
		net.ipv4.conf.all.accept_source_route = 0
		net.ipv6.conf.all.accept_source_route = 0
		net.ipv4.conf.default.accept_source_route = 0
		net.ipv6.conf.default.accept_source_route = 0
		net.ipv4.conf.all.send_redirects = 0
		net.ipv4.conf.default.send_redirects = 0
		net.ipv4.tcp_max_syn_backlog = 2048
		net.ipv4.tcp_synack_retries = 2
		net.ipv4.tcp_syn_retries = 5
		net.ipv4.conf.all.log_martians = 1
		net.ipv4.icmp_ignore_bogus_error_responses = 1
		net.ipv4.conf.all.accept_redirects = 0
		net.ipv6.conf.all.accept_redirects = 0
		net.ipv4.conf.default.accept_redirects = 0
		net.ipv6.conf.default.accept_redirects = 0
		net.ipv4.icmp_echo_ignore_all = 1
		#End of Additions" >> /etc/sysctl.d/10-network-security.conf
		service procps start

		echo "configured wireless"
	else
		clear
		echo "not configuring wireless!"
	fi
}
