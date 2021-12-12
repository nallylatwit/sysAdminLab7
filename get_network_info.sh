#!/bin/bash

if [[ $# -ne 0 ]]; then
	echo "This script requires no arguments."
	exit 0
fi

ip4=$(ip a | grep inet | awk NR==3'{print $2}')
echo "IPv4: $ip4"

mac=$(ip a | grep link/ether | awk NR==1'{print $2}')
echo "MAC : $mac"

gate=$(ip r | awk NR==2'{print $3}')
echo "Gateway: $gate"

dns=$(cat /etc/resolv.conf | awk NR==3'{print $2}')
echo "DNS: $dns"

domain=$(cat /etc/resolv.conf | awk NR==2'{print $3}')
echo "Domain: $domain"

nics=$(sudo ethtool enp0s3 | grep Speed | awk '{print $2}')
echo "NIC Speed: $nics"

nicd=$(sudo ethtool enp0s3 | grep Duplex | awk '{print $2}')
echo "NIC Duplex: $nicd"
