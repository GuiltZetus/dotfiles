#!/bin/bash

# Define your desired warm temperature
WARM_TEMP=2800

# Define your desired default/neutral temperature (e.g., standard daylight)
DEFAULT_TEMP=6500

# Define a state file to keep track of the current setting
# This file will be created when warm mode is active, and removed when default is active.
STATE_FILE="/tmp/hyprsunset_warm_active"

# Check if the state file exists
if [ -f "$STATE_FILE" ]; then
    # If the file exists, warm mode is active, so switch to default
    hyprctl hyprsunset temperature $DEFAULT_TEMP
    rm "$STATE_FILE" # Remove the flag file
else
    # If the file doesn't exist, warm mode is inactive, so switch to warm
    hyprctl hyprsunset temperature $WARM_TEMP
    touch "$STATE_FILE" # Create the flag file
fi
