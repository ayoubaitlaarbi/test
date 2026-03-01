#!/bin/bash 

# This script contains rulles of the fire wall 
# if you want to run ./firewall/firewall_rules.sh


# Default policy 
# block all incomming trafic
sudo iptables -P INPUT DROP
# block all forwarding trafic 
sudo iptables -P FORWARD DROP
# accept the output 
sudo iptables -P OUTPUT ACCEPT


# Connection Tracking 
# To accept all trafic that cumming for existing or related connection for the machin and for forwarding.
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT





