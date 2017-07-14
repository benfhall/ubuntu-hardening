#!/bin/bash
function wirelessf()
{
	if echo "$wirelessq" | grep -iq "^y" ;then
    sudo rm -rf etc/NetworkManager/system-connections/ && mkdir etc/NetworkManager/system-connections/
    sudo echo "nospoof on" >> /etc/host.conf
		sudo echo "disable_functions = exec,system,shell_exec,passthruregister_globals = Off expose_php = Off display_errors = Off track_errors = Offhtml_errors = Off magic_quotes_gpc = Off" >> /etc/php5/apache2/php.ini
		sudo sed -ie 's/net.ipv6.conf.all.disable_ipv6 = 0/net.ipv6.conf.all.disable_ipv6 = 1/g' /etc/syctl.conf
		sudo sed -ie 's/net.ipv6.conf.default.disable_ipv6 = 0/net.ipv6.conf.default.disable_ipv6 = 1/g' /etc/syctl.conf
		sudo sed -ie 's/net.ipv6.conf.lo.disable_ipv6 = 0/net.ipv6.conf.lo.disable_ipv6 = 1/g' /etc/syctl.conf
		sudo sysctl -p
		sudo sed -ie 's/ENABLED=1/ENABLED=0/g' /etc/default/irqbalance
		echo "configured wireless"
	else
		clear
		echo "not configuring wireless!"
	fi
}
