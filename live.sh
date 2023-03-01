#!/bin/bash
printf "Enter name of File:"
read -r name

nmap $1 -n -sP | grep report | awk '{print $5}'
nmap $1 -n -sP | grep report | awk '{print $5}' >> $name
