#!/bin/bash
# this script for start a web server . i use a simple configuration , default one , i change only the ports to 8000 , 4443 on local network . 
# services/start_web.sh
# 


# the name of the service
SERVICE="apache2"

# check if the service was installed
if ! systemctl list-unit-files | grep -q "$SERVICE"; then
    echo "$SERVICE not installed!"
    exit 1
fi

# start the service
echo "Starting $SERVICE ..."
sudo systemctl start $SERVICE


# check if the service is active 
STATUS=$(systemctl is-active $SERVICE)
if [ "$STATUS" = "active" ]; then
    echo "$SERVICE is active"
    echo "Server ip : "
    hostname -I
    echo "Server ports"
    ss -tulpn | grep -E '8000|4443' | awk '{print $5}'
else
    echo "Failed to start $SERVICE "
fi
