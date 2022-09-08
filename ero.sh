# !bin/bash
# open ~/Desktop/Bangumi
cd /Volumes/smbnas/Library/Ero/
# $(ls -d -1 "$PWD/"*.mp4)>>~/Desktop/av.m3u8
# ls  -R  | grep -n '.m[pk][4v]'>~/Desktop/av.m3u8
# touch ~/Desktop/log.txt
find $PWD/ -name '*.m[pk][4v]' >~/Desktop/av.m3u8
# awk -F: '{print $1 }' ~/Desktop/log.txt>~/Desktop/av.m3u8
# rm ~/Desktop/log.txt
open ~/Desktop/av.m3u8
#
