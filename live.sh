#!/bin/bash

# Prompt the user for the network range
read -p "Enter the network range (e.g., 192.168.1.0/24): " network_range

# Check if the network range is provided
if [ -z "$network_range" ]; then
    echo "Error: No network range provided."
    exit 1
fi

# Use nmap to scan the network range and extract live hosts
live_hosts=$(nmap -sn -n "$network_range" | grep "Nmap scan report" | awk '{print $5}')

# Check if any live hosts were found
if [ -z "$live_hosts" ]; then
    echo "No live hosts found in the network range: $network_range"
    exit 1
fi

# Save the live hosts to a text file
output_file="live_hosts_$(date +%Y%m%d).txt"
echo "Live hosts in the network range: $network_range" > "$output_file"
echo "$live_hosts" >> "$output_file"

echo "Live hosts have been saved to $output_file"

exit 0
