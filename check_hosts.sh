#!/bin/bash

validate_ip() {
	local host=$1
	local ip=$2
	local dns_server=$3

	if ! nslookup "$host" "$dns_server" 2>/dev/null | grep -q "$ip"; then
		echo "Bogus IP for $host in /etc/hosts!"
	fi
}

cat /etc/hosts | while read ip name alias; do
	if [[ -z "$ip" ]] || [[ "$ip" == \#* ]] || [[ "$ip" == *:* ]] || [[ "$name" == *"local"* ]]; then
		continue
	fi

	validate_ip "$name" "$ip" "8.8.8.8"

done

echo "Modificat de studenta Maria"

