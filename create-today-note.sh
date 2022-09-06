# !/bin/bash
  filename=~/Documents/zettle/journal/$(date +%Y-%m-%d).md
  editor="code"

    if [[ $1 ]]; then
     editor=$1 
    fi

  if [[ -f "$filename" ]]; then
   $editor $filename
  else
  touch $filename
  today=$(date +"%A %Y-%m-%d")
  # echo  '---'>>$filename
  # echo  'title: '$today>>$filename
  echo  '# '$today>>$filename
  # echo  '---'>>$filename
  $editor $filename
  fi

