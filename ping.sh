#! /bin/bash
for ip in `cat ~/ip_record.txt`
do
ping=`ping -c 5 -W 300 $ip|grep loss|awk '{print $7}'|awk -F "%" '{print $1*100/100}'`
if [ $ping -eq 100  ];then
echo $ip 丢包 $ping 
else
echo $ip 丢包 $ping
fi
done
