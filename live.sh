#!/bin/bash

# Prompt the user for the name of a file
printf "Enter the name of result File:"
read -r name

# Scan the network for active hosts
nmap $1 -n -sP | grep report | awk '{print $5}'

# Print a livehost to the user
nmap $1 -n -sP | grep report | awk '{print $5}' >> $name
