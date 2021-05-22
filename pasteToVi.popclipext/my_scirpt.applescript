tell application id "com.googlecode.iterm2"
activate
set _session to current session of current window
tell _session
set command to get the clipboard
tell application "System Events" to keystroke return
write text "i {popclip text}"
tell application "System Events"
  key code 53
end tell
end tell
end tell
