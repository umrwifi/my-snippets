#!/bin/sh
umount /Volumes/nfs 
mkdir /Volumes/nfs 
chown admin:staff /Volumes/nfs 
mount -t nfs -o noexec,nosuid,nodev,rw,tcp,bg,intr,rsize=65536,wsize=65536  192.168.50.200:/mnt/nas /Volumes/nfs
