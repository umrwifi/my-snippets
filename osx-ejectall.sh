# mac 退出全部磁盘 command
osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)'