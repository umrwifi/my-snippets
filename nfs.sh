sudo diskutil umount /Volumes/nas
sudo mkdir /Volumes/nas
sudo chown  admin:staff  /Volumes/nas
sudo mount -t nfs -o  nolock,rw 192.168.50.200:/mnt/nas  /Volumes/nas
# resvport
