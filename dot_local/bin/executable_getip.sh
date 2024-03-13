#!/bin/bash
# Get public IP4 using online servies that responds with you public IP.
# The service is selected by random every time the script is executed.

# TODO
# - Add test function that tests all the URLs.

urls=(https://ipinfo.io
https://www.jsonip.com
https://api.ipify.org
https://ipv4.icanhazip.com
https://ipecho.net/plain
)
function curlIP() {
        IPADDR=$(curl --connect-timeout 8 "$1" 2>/dev/null | grep -oP "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")
        echo "$IPADDR"
}

readarray -t sorted < <(for a in "${urls[@]}";
do
        echo "$a";
done | sort --random-sort)

for url in "${sorted[@]}"
do
        IPADDR=$(curlIP "$url")
        [[ -n "$IPADDR" ]] && break
done

echo "$IPADDR"
