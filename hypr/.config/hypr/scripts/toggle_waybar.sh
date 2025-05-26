#!/bin/bash

# Define the Waybar process name
WAYBAR_PROCESS="waybar"

# Check if Waybar is currently running
if pgrep -x "$WAYBAR_PROCESS" > /dev/null; then
    # If Waybar is running, kill it
    pkill -x "$WAYBAR_PROCESS"
    echo "Waybar killed."
else
    # If Waybar is not running, launch it
    # You might need to adjust the path to your waybar config and style files
    # Depending on how you launch Waybar normally.
    # A common way is to just run 'waybar' if it's in your PATH.
    # If you use a specific config, e.g., ~/.config/waybar/config,
    # you might need to add '-c ~/.config/waybar/config' etc.
    waybar &
    echo "Waybar launched."
fi
