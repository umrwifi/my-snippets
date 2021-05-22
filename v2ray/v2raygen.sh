#!/bin/bash

systemctl stop firewalld
systemctl disable firewalld
systemctl stop ufw
systemctl disable ufw
#安装v2
bash <(curl -L -s https://install.direct/go.sh)

#生成随机整数，用来生成端口
rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(cat /dev/urandom | head -n 10 | cksum | awk -F ' ' '{print $1}')
    echo $(($num%$max+$min))  
}

#获取本机外网ip
serverip=$(curl ipv4.icanhazip.com)
cd /etc/v2ray
rm -f /etc/v2ray/config.json

cat > /etc/v2ray/config.json<<-EOF


{
    "outbounds": [
        {
            "protocol": "vless",
            "settings": {
                "vnext": [
                    {
                        "address": "umrwifi.top",
                        "port": 443,
                        "users": [
                            {
                                "id": "456dc87d-9427-4055-be6b-d17e76323d2b",
                                "encryption": "none",
                                "security": "auto"
                            }
                        ]
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "tls",
                "tlsSettings": {
                    "serverName": "umrwifi.top"
                },
                "wsSettings": {
                    "path": "/free",
                    "headers": {
                        "Host": "umrwifi.top"
                    }
                }
            },
            "mux": {
                "enabled": false
            }
        },
        {
            "protocol": "freedom",
            "settings": {},
            "tag": "direct"
        },
        {
			"protocol": "blackhole",
			"settings": {},
			"tag": "blocked"
        },
        {
            "protocol": "dns",
            "tag": "dns-out"
        }
    ],
    "inbounds": [
        {
            "port": "1099",
            "protocol": "dokodemo-door",
            "settings": {
              "network": "tcp,udp",
              "timeout": 0,
              "followRedirect": true
            },
            "sniffing": {
              "enabled": true,
              "destOverride": ["http", "tls"]
            }
        },
        {
            "port": 2133,
            "tag": "dns-in",
            "protocol": "dokodemo-door",
            "settings": {
                "address": "119.29.29.29",
                "port": 53,
                "timeout": 0,
                "network": "tcp,udp"
            }
        },
        {
            "port": 2333,
            "protocol": "socks",
            "settings": {
                "auth": "noauth",
                "udp": true
            }
        },
        {
            "port": 6666,
            "protocol": "http",
            "settings": {
                "auth": "noauth",
                "udp": true
            }
        }
    ],
    "dns": {
        "servers": [
            {
                "address": "119.29.29.29",
                "port": 53,
                "domains": [
                  "geosite:cn"
                ],
                "expectIPs": [
                  "geoip:cn"
                ]
              },
              {
                "address": "1.1.1.1",
                "port": 53,
                "domains": [
                  "geosite:geolocation-!cn"
                ]
            },
            "8.8.8.8",
            "localhost"
        ]
    },
    "routing": {
        "domainStrategy": "IPOnDemand",	
        "rules": [
            {
                "type": "field",
                "inboundTag": [
                    "dns-in"
                ],
                "outboundTag": "dns-out"
            },
            {
				"type": "field",
				"ip": [
					"geoip:private"
				],
				"outboundTag": "blocked"
			},
            {
                "type": "field",
                "ip": [
                    "geoip:cn"
                ],
                "outboundTag": "direct"
            },
            {
                "type": "field",
                "domain": [
                    "geosite:cn"
                ],
                "outboundTag": "direct"
            }
        ]
    }
}


EOF

#生成并替换uuid，kcp、tcp各一个
kcpuuid=$(cat /proc/sys/kernel/random/uuid)
tcpuuid=$(cat /proc/sys/kernel/random/uuid)
sed -i "s/aaaa/$kcpuuid/;s/bbbb/$tcpuuid/;" config.json

#生成并修改端口
port=$(rand 10000 60000)
sed -i "s/11234/$port/" config.json

#重启prov
systemctl restart v2ray.service

#输出配置到文件
cat > /etc/v2ray/myconfig.json<<-EOF
{
===========KCP配置=============
地址：${serverip}
端口：${port}
uuid：${kcpuuid}
额外id：64
加密方式：aes-128-gcm
传输协议：kcp
别名：mykcp
伪装类型：none

===========TCP配置=============
地址：${serverip}
端口：${port}
uuid：${tcpuuid}
额外id：64
加密方式：aes-128-gcm
传输协议：tcp
别名：mytcp
伪装类型：none
}
EOF


#输出配置信息
clear
echo
echo "安装已经完成，开启了kcp和tcp两种模式，客户端可任意选择对应的配置"
echo 
echo "===========KCP配置============="
echo "地址：${serverip}"
echo "端口：${port}"
echo "uuid：${kcpuuid}"
echo "额外id：64"
echo "加密方式：aes-128-gcm"
echo "传输协议：kcp"
echo "别名：mykcp"
echo "伪装类型：none"
echo 
echo "===========TCP配置============="
echo "地址：${serverip}"
echo "端口：${port}"
echo "uuid：${tcpuuid}"
echo "额外id：64"
echo "加密方式：aes-128-gcm"
echo "传输协议：tcp"
echo "别名：mytcp"
echo "伪装类型：none"
echo



