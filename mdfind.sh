#!/bin/sh
nas=$(mdfind "$1" -onlyin /Volumes/nas)
local=$(mdfind "$1" )
IFS=$'\n'
in=0
for i in $local$nas
do
    array[$in]=\"$i\"
    #echo array[$in]
    let in+=1
done
    #echo ${array[*]}
echo "${array[*]}"|fzf -m|pbcopy|pbpaste
#echo "${cmd}"|fzf -m
#open "$(md onegai)" 
