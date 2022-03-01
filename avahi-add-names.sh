#!/bin/bash

# https://pi3g.com/2019/04/10/avahi-how-to-assign-several-local-names-to-same-ip/

domains=(octoprint.local test.local)

IP=`ip addr | grep 192.168.1 | awk '{print $2}' | cut -d "/" -f 1`

echo $IP

for val in "${domains[@]}"; do
	echo $val
	/usr/bin/avahi-publish -a -R $val $IP &
done
