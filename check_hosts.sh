#!/bin/bash

cat /etc/hosts | while read ip_local nume_host aliasuri; do

	if [[ -z "$ip_local" ]] || [[ "$ip_local" == \#* ]]; then
		continue
	fi

	if [[ "$ip_local" == *:* ]]; then
		continue
	fi

	if [[ "$nume_host" == *"local"* ]]; then
        	continue
   	 fi

	if ! nslookup "$nume_host" 8.8.8.8  2>/dev/null | grep -q "$ip_local"; then
		echo "Bogus ID for $nume_host in /etc/hosts"
	fi

done
