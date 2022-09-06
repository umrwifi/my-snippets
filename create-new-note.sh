  filename=$*
     touch tmp
     touch $filename.md
    echo "# $filename" > tmp
      today=$(date +"%Y-%m-%d")
     echo "created: [["$today"]]" >> tmp 
    cat tmp > $filename.md
    rm tmp
    code $filename.md
