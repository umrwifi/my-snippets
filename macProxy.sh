
#! /bin/bash
networksetup -setsocksfirewallproxy 'Wi-fi' 127.0.0.1 1080  
networksetup -setwebproxy 'Wi-fi' 127.0.0.1 8001
# /Applications/v2ray/v2ray
v2ray -config /usr/local/etc/v2ray/nyanpath.json
echo success
