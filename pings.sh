#! /bin/bash
for ip in `cat ~/ip_record.txt`
do
loss=`ping -c 5 -W 300 $ip|grep loss|awk '{print $7}'|awk -F "%" '{print $1*100/100}'`
echo $ip 丢包 $loss
done
