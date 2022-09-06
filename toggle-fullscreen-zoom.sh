# 当前app
# yabai -m query --windows --window | jq '."has-fullscreen-zoom"'
haszoom=$(yabai -m query --windows --window | jq '."has-fullscreen-zoom"')

if [ $haszoom == true ] ; then 
yabai -m space --layout bsp
else 
  yabai -m window --toggle zoom-fullscreen 
fi
