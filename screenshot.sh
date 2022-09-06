# 参考 https://osxdaily.com/2011/08/11/take-screen-shots-terminal-mac-os-x/
# cmd截图
week=$(date +"%A")
ymd=$(date +"%Y-%m-%d")
time=$(date +"%H.%M.%S")
# echo $time
# -t 可以把png截图转换成jpeg大大减小了截图的尺寸。
screencapture -r -m -t jpeg ~/Pictures/Screenshots/$week\ $ymd\ $time.png

