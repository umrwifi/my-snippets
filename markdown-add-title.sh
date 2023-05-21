# !/bin/zsh
# 为每个markdown文件添加一个标题
path="$*"
IFS=$'\n'
cd $path

for filename in `ls *.md`
  do 
line=$(head -n 1 $filename)
     #TODO 如果碰到windows换行符就会不匹配，解决方法是先对line进行substr后再比较
   if [[ "${line}" != --- ]] 
   then
     echo create title for $filename
     touch tmp
     cat $filename > tmp
    echo '---' > $filename
    echo "title: $filename" >> $filename
    echo '---' >> $filename
    cat tmp >> $filename
    rm tmp
   
   fi
  done
