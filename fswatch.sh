#文件监控
## 当文件新建或删除时更新index目文件
fswatch --event=Renamed --event=Created --event=Removed ~/Documents/zettle | (while read; do ls -R ~/Documents/zettle>~/Documents/zettle/文件.txt; done) &

