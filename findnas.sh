#!/bin/sh
nas=$(find /Volumes/nfs)
IFS=$'\n'
in=0
for i in $nas
do
    array[$in]=\"$i\"
    #echo array[$in]
    let in+=1
done
IFS=$'\n'
echo "${array[*]}"|fzf -m| xargs open
