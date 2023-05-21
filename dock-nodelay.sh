    # dock 隐藏和出现动画无延迟 
    defaults write com.apple.Dock autohide-delay -float 0
    killall Dock
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
