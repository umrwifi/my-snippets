# !/bin/bash
# 以文本为单位的多关键词匹配搜索
# 参数以半角空格作为分隔符

IFS=$'\n'
# 以换行符作为参数的分隔符，防止文件名中存在空格
let count=1
let countmax=$#

# 如果只是搜索单个关键词，直接输出结果。
if [ $countmax -eq 1 ]; then
    grep -Hn $1 * | awk -F: '{print "\033[93m"$1":"$2"\033[0m""   "$3 $4 $5 $6 }'
    exit
fi

# 用循环来递归筛选匹配文件，并存入tmp文件
# trim 空格
for word in $*; do
    if [ $count -eq 1 ]; then
        grep -r -l $word * >tmp$count
        count=$((count + 1))
    else
        # 循环文件中的每行，作为grep匹配的文件
        while read p; do
            grep -l $word $p
        done <tmp$((count - 1)) >tmp$count
        count=$((count + 1))
    fi
done

# 搜索出每个匹配文件的文件名、行号、匹配行，format后存入tmp文件
for word in $*; do
    # TODO trim
    while read p; do
        grep -Hn $word $p --exclude="tmp*" | awk -F: '{print "\033[93m"$1":"$2"\033[0m""   "$3 $4 $5 $6 }'
        # 打印格式： journal/2022-08-28.md:6     匹配正则 [[hack]]
    done <tmp$((count - 1)) >>tmp$count
done

# 用sort按照文件名与行号来给tmp文件中的搜索结果排序并打印
echo "find from path " $(pwd)
sort tmp$count
# 删除tmp文件
rm tmp*
