rm -rf  ~/Documents/Playlist/
mkdir  ~/Documents/Playlist
IFS=$'\n'
# for file in $(ls | sed "s:^:`pwd`/:")
cd /Volumes/smbnas/Movies
for file in $(ls)
do
  echo `pwd`/$file> ~/Documents/Playlist/$file.m3u8
done

