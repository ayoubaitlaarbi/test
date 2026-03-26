#!/bin/bash


#HTTP/HTTPS NAT
#Translation all packets with destination prot 80 and IP 172.17.0.2 to 192.168.0.2:8000
iptables -t nat -A PREROUTING -p tcp --dport 80 -d 172.17.0.2 -j DNAT --to-destination 192.168.0.2:8000
#The same things the only change is port 443 to 4443
iptables -t nat -A PREROUTING -p tcp --dport 443 -d 172.17.0.2 -j DNAT --to-destination 192.168.0.2:4443

#When the server replay .Change the source ip to public IP.
iptables -t nat -A POSTROUTING -s 192.168.0.2 -o eth0 -j SNAT --to-source 172.17.0.2


#FTP NAT
#Redirect all packet to 192.168.0.2:21
iptables -t nat -A PREROUTING -p tcp --dport 21 -d 172.17.0.2 -j DNAT --to-destination 192.168.0.2:21
#Source ip 172.17.0.2
iptables -t nat -A POSTROUTING -s 192.168.0.2 -o eth0 -j SNAT --to-source 172.17.0.2

