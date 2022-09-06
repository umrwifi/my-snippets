#!/bin/sh
sudo umount /Volumes/nas 
sudo mkdir /Volumes/nas 
sudo mount -t nfs -o noexec,nosuid,nodev,rw,tcp,bg,intr,rsize=65536,wsize=65536,vers=4  192.168.50.200:/mnt/nas /Volumes/nas
# mount -t nfs 192.168.50.200:/mnt/nas  /Volumes/nas
