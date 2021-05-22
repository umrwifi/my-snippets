# 批量操作文件 无需转译路径
IFS=$'\n'
for file in `ls`
do
        newfile=$file.zip
        echo $newfile
        zip -r $newfile $file
done

