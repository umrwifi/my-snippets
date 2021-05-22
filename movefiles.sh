#！/bin/bash

#if [ $# -ne 3 ];
#then
#	echo "Usage : $0 File_name"
#	exit
# fi

movemoto="$2"
movesaki=$3
File=$1
count=0
echo "start"
for LINE in `awk -F, '{print $1}'  $File`
do
    for i in `ls $movemoto`
  do 
  echo 
   if [[ "$i" =~ "$LINE" ]] ;then 
   	let count++
    echo "$count $LINE"
    user_file=`ls $movemoto/$i|grep "^user"`
    group_file=`ls $movemoto/$i|grep "^group"`
      mkdir -p uploadFile/user/"$i"
      cp  "$2/""$i/""$user_file"  "uploadFile/user/$i"
       mkdir -p uploadFile/group/"$i"
      cp  "$2/""$i/""$group_file"  "uploadFile/group/$i"
    fi
  done
done 
 mkdir -p userInfo
  cp -f "$File"   userInfo/"$File"
exit
