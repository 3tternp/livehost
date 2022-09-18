#!/bin/bash
printf "Enter name of File:"
read -r name
nmap $1 -n -sP -Pn | grep report | awk '{print $5}'
nmap $1 -n -sP -Pn | grep report | awk '{print $5}' >> $name
