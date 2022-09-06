#!/bin/bash

if [[ $* = "" ]] 
then
sudo mdutil -E -i off
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
else 
sudo mdutil -E -i on
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
fi
