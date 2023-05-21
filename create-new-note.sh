# TODO crop .md
filename=$*
touch tmp
touch $filename.md
echo "# $filename" >tmp
today=$(date +"%Y-%m-%d")
now=$(date +"%H:%M")
echo "created: [["$today"]]"$now >>tmp
cat tmp >$filename.md
rm tmp
code $filename.md
