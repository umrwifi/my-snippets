#!/bin/bash

osascript << END
set mydate to (current date) + (1 * minutes)
tell application "Reminders"
    make new reminder with properties {name:"This is a cron reminder", remind me date:mydate, due date:mydate}
end tell
END
