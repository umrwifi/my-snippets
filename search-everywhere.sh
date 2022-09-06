# !/bin/bash
# 以文件为单位（多行搜索）的多关键词搜索工具
# 参数以半角空格作为分隔符

# grep -l -e 'remote' *.md | xargs grep split
# let cmd
# let grepStr
# let grepStr2
# for word in $* ; do
#    grepStr="$grepStr|$word"
# done
#  grepStr="grep -l -e \"[$grepStr]\" *.md" 
#  grepStr="grep -r -l \"[$grepStr]\" *.md" 
# echo $grepStr
let count=1
# for word in $* ; do
       # ← put the command whos exit code you want to check here &>/dev/null
#    if [ $count -eq 1 ]; then
#    grepStr2="grep $word *.md" 
#    count=$((count + 1))
#    else
#    grepStr2="$grepStr2|xargs grep -l $word *.md"
#    fi 
# done
# cmd="$grepStr$grepStr2"
# echo $cmd
# eval $cmd

# grep -r -l '游戏愿望单' * > tmp; while read p; do grep -l '小说' $p; done < tmp; rm tmp


for word in $* ; do
       # ← put the command whos exit code you want to check here &>/dev/null
    if [ $count -eq 1 ]; then
grep -r -l $word * > tmp; 
    count=$((count + 1))
    else
    while read p; 
    do 
    grep -Hn $word $p | cut -d: -f1 -f2 
    # TODO awk排版 
    # grep -l $word $p 
    done < tmp  ; >tmp 
    fi 
    # while read p; 
    # do 
    # grep -Hn $word $p 
    # done < tmp; 
done

    # fi
    # cat tmp  
rm tmp
# 牛逼啊！