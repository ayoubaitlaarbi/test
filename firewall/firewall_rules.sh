#!/bin/bash 

# This script contains rules of the firewall 
# if you want to run ./firewall/firewall_rules.sh


# Default policy 
# block all incomming traffic
sudo iptables -P INPUT DROP
# block all forwarding trafic 
sudo iptables -P FORWARD DROP
# accept the output 
sudo iptables -P OUTPUT ACCEPT


# Connection Tracking 
# Accept all traffic that coming for existing or related connection for the machin and for forwarding.
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


# HTTP/HTTPS Access
# Accept all tcp packet with port 8000 or 4443 , to specific ip address.
iptables -A FORWARD -p tcp --dport 8000 -d 192.168.0.10 -j ACCEPT
iptables -A FORWARD -p tcp --dport 4443 -d 192.168.0.10 -j ACCEPT

# FTP Access
# Accept all tcp packet with port 21.
iptables -A FORWARD -p tcp --dport 21 -d 192.168.0.20 -j ACCEPT

# SMTP Access 
# Accept port 25
iptables -A FORWARD -p tcp --dport 25 -d 192.168.0.10 -j ACCEPT

# DNS Access
# Accept port 53
iptables -A FORWARD -p tcp --dport 53 -d 192.168.0.10 -j ACCEPT
