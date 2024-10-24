#!/bin/bash

read -r -p "ENTER IP=" IP

# DEFINE PORTS HERE------------

ports="-p 0-25,80,111,135,443,445,554,1720-1730,3306,3389,6379,8080"

# Ensure the IP is provided
if [ -z "$IP" ]; then
  echo "IP address cannot be empty."
  exit 1
fi


read -r -p "OUTPUT FILENAME=" OUT

# Check if output provided
if [ -z "$OUT" ]; then
    sudo nmap $ports -sC -sV "$IP"
    exit 1
fi

sudo sudo nmap $ports -sC -sV -oN "$OUT" "$IP"
