#!/bin/bash
# 当前app
# yabai -m query --windows --window | jq '."has-fullscreen-zoom"'
haszoom=$(yabai -m query --windows --window | jq '."has-fullscreen-zoom"')
fuck=$(yabai -m query --spaces --space | jq '."type"')
    skhd -k "alt + cmd - h"
if [[ "${fuck}" == *"bsp"* ]]; then
    yabai -m space --layout stack;
    # yabai -m space --layout float;
# elif [[ "$fuck" == *"float"* ]]; then
else
    yabai -m space --layout bsp
    skhd -k "cmd - tab";
    yabai -m window --focus recent
fi
