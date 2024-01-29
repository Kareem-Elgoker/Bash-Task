#!/bin/bash

warp-cli disconnect
warp-cli delete

sleep 1

sudo warp-svc register&
sudo warp-cli register
sudo warp-cli connect

sleep 2

Connection=$(ifconfig | grep "WARP" | cut -d ':' -f1)

if [ "$Connection" == "CloudflareWARP" ]
then
	echo "WARP is connected successfully"

	read -p "Enter the openvpn file location : " Location
	sudo openvpn "$Location"

	sleep 2

	warp-cli disconnect
	exit
else
	echo "WARP is not connected......exit"
	exit
fi
