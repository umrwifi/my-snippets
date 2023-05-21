# 两行代码写了2个小时
# 获取当前窗口的app
let appname=$(yabai -m query --windows --window | jq '.app')
# 在当前app中还原最小化窗口
yabai -m query --windows |
    jq '.[] | select((."is-minimized" == true) and ."app" == '$appname').id' |
    xargs yabai -m window --deminimize $1
