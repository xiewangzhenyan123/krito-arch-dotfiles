#!/bin/bash

# Variables
SELECTED_WALLPAPER=$1
WALLPAPER_DIR="$HOME/.config/wallpaper"

# Ensure the wallpaper exists
if [ ! -f "$WALLPAPER_DIR/$SELECTED_WALLPAPER.jpeg" ]; then
    echo "Error: Wallpaper not found: $SELECTED_WALLPAPER"
    exit 1
fi

# Apply pywal colors
wal -i "$WALLPAPER_DIR/$SELECTED_WALLPAPER.jpeg" || { echo "Error: pywal failed"; exit 1; }

# Reload eww
killall eww || echo "Warning: No eww process found"
eww open side-bar

# Restart hyprpaper
killall hyprpaper || echo "Warning: No hyprpaper process found"
hyprpaper &

