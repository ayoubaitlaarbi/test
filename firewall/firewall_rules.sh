#!/bin/bash 

# This script contains rulles of the fire wall 
# if you want to run ./firewall/firewall_rules.sh


#Default policy 
#block all incomming trafic
sudo iptables -P INPUT DROP
#block all forwarding trafic 
sudo iptables -P FORWARD DROP
#accept the output 
sudo iptables -P OUTPUT ACCEPT



