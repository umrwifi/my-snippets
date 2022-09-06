#!bin/sh
## 当下载完电子书后自动解密
# fswatch --event=Created  ~/Downloads/*.azw3 | (while read; do bash ~/dedrm-kinlde-unpack/dedrm.sh $* ; done) &
