# awk F后跟匹配项
for file in $(ls *.srt) ; do ; mv $file "Elfen Lied"$(ls $file |awk -F d '{print $2}')  ; done
