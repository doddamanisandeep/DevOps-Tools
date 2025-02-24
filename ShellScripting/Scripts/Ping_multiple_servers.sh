#!/bin/bash

# List of servers
servers=("google.com" "github.com" "yahoo.com")

# Loop through each server and ping
for server in "${servers[@]}"; do
    if ping -c 1 "$server" &> /dev/null; then
        echo "$server is UP"
    else
        echo "$server is DOWN"
    fi
done
