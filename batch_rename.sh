
for file in $(ls *.srt) ; do ; mv $file "Elfen Lied"$(ls $file |awk -F d '{print $2}')  ; done
