if running of application "System Preferences" then
	quit application "System Preferences"
	delay 1
end if

tell application "System Preferences"
	reveal anchor "displaysDisplayTab" of pane id "com.apple.preference.displays"
	delay 1
	tell application "System Events"
		try
			tell pop up button "Rotation:" of tab group 1 of window 2 of application process "System Preferences"
				if (value) contains "Standard" then
					click
					click menu item "90бу" of menu 1
					my clickConfirmButton()
				else
					click
					click menu item "Standard" of menu 1
				end if
			end tell
		on error errMsg
			tell pop up button "Rotation:" of tab group 1 of window 1 of application process "System Preferences"
				if (value) contains "Standard" then
					click
					click menu item "90бу" of menu 1
					my clickConfirmButton()
				else
					click
					click menu item "Standard" of menu 1
				end if
			end tell
		end try
	end tell
	quit
end tell

on clickConfirmButton()
	set wasClicked to false
	repeat until wasClicked
		delay 0.5
		tell application "System Events"
			try
				click button "Confirm" of sheet 1 of window 1 of application process "System Preferences"
				set wasClicked to true
			end try
		end tell
	end repeat
end clickConfirmButton
