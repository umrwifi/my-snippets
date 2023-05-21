# !/bin/bash

# default name: yyyy-mm-dd.md
  filename=~/Documents/zettle/journal/$(date +%Y-%m-%d).md
# vscode
  editor="code"

    if [[ $1 ]]; then
     editor=$1 
    fi

  # if file exit
  if [[ -f "$filename" ]]; then
   $editor $filename
  else
  # create file
  touch $filename
  title=$(date +"%A %Y-%m-%d")
  echo  '# '$title>>$filename
  $editor $filename

  # hexo style
  # echo  '---'>>$filename
  # echo  'title: '$title>>$filename
  # echo  '---'>>$filename

  fi

