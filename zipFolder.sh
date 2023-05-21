#!/bin/bash
# 把当前目录下的所有文件夹压缩成zip

for dir in "$*"* ; do
    if [ -d "$dir" ]; then
        zip -r "${dir%/}.cbz" "$dir"
    fi
done
