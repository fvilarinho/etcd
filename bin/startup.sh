#!/bin/bash

echo "Starting the service..."

etcd &

echo "Service started!"

$BIN_DIR/install.sh

while [ true ];
do
	PID=`pidof etcd`
	
	if [ ! -z "$PID" ]; then
		sleep 1
	else
		echo "Stopping the service..."
		
		break
	fi
done

echo "Service stopped!"