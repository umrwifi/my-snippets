# 正则批量重命名文件
path="$*"
IFS=$'\n'
cd $path
# find . -maxdepth 1  -name "*" | while read filename; 
#=====================================================
# linux find regex
### find -E . -regex "*.(mp4|mkv)" | while read filename; 
# macos need to add .*/ on the head
find -E . -regex ".*/*.(mp4|mkv)" | while read filename; 
#=======================================================
# TODO 打印清单 保存原文件名
## trim 头就可以了
 do 
   # remove all the [],()'s infomation
   newfilename=`echo $filename | perl -pe 's/(\[.*?\]|\(.*?\))//g'` 
   # trim filename
   newfilename=./`echo $newfilename | perl -pe 's/(\.\/[ \t]*|[ \t]*\.)/./g' `
   echo $newfilename

   if [[ "$newfilename" != "$filename" ]]
   then
     # echo file $filename
     # echo new file $newfilename
    # mv "$filename" "$newfilename" ;
    echo 
   fi
 done 
