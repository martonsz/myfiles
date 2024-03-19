#!/bin/bash
# Get public IP4 using online services that responds with you public IP.
# The service is selected by random every time the script is executed.

urls=(
https://ipinfo.io
https://api.ipify.org
https://ipv4.icanhazip.com
https://ipecho.net/plain
)

# Function to get IP
getIP() {
    for url in "${urls[@]}"; do
        IPADDR=$(curl --connect-timeout 8 "$url" 2>/dev/null | grep -Eo "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")
        if [[ -n "$IPADDR" ]]; then
            echo "$IPADDR"
            return
        fi
    done
    echo "Failed to retrieve IP address"
    exit 1
}

# Function to test all endpoints
testEndpoints() {
    for url in "${urls[@]}"; do
        echo "Testing $url"
        IPADDR=$(curl --connect-timeout 8 "$url" 2>/dev/null | grep -Eo "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")
        if [[ -n "$IPADDR" ]]; then
            echo "Success: $IPADDR"
        else
            echo "Failed"
        fi
    done
}

# Check for "test" argument
if [[ $1 == "test" ]]; then
    testEndpoints
else
    getIP
fi
