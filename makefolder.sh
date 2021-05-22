#！/bin/bash

if [ $# -ne 1 ];
then
	echo "Usage : $0 File_name"
	exit
fi

#获取文件名
File_name=$1
count=0
mkdir "schedule"
mkdir "device"
mkdir "user"
mkdir "group"
while read LINE
do
	#记录行数
	let count++
	#打印行号及其内容
	echo "$count $LINE"
	mkdir "schedule/$LINE"
	mkdir "group/$LINE"
	mkdir "user/$LINE"
	mkdir "device/$LINE"
done < $File_name

