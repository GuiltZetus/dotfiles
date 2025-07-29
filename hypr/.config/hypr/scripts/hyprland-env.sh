#!/bin/bash
# ~/.dotfiles/hypr/.config/hypr/hyprland-env.sh

# Set XDG_RUNTIME_DIR if not already set (it typically is by systemd/login manager)
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

# Get HYPRLAND_INSTANCE_SIGNATURE dynamically if not set
# This relies on the Hyprland socket existing.
if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    # Try to find the socket to deduce the signature
    local_socket_path="${XDG_RUNTIME_DIR}/hypr/*/.socket2.sock"
    found_socket=$(ls "$local_socket_path" 2>/dev/null | head -n 1)

    if [ -n "$found_socket" ] && [ -S "$found_socket" ]; then
        # Extract the signature from the path
        export HYPRLAND_INSTANCE_SIGNATURE=$(basename "$(dirname "$(dirname "$found_socket")")")
    else
        echo "Warning: HYPRLAND_INSTANCE_SIGNATURE could not be determined." >&2
    fi
fi

# Optional: You can add other environment variables here that you want available
# to all scripts that need Hyprland context.
