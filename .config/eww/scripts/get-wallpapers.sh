#!/bin/bash

DIRECTORY=~/.config/wallpaper/
DIRECTORY=$(eval echo $DIRECTORY)

if [ -d "$DIRECTORY" ]; then
    # Extract filenames, filter for integers, remove extensions, and format as JSON array
    find "$DIRECTORY" -type f \( -name "*.jpeg" -o -name "*.png" \) \
        -exec basename {} \; | grep -E '^[0-9]+(\.jpeg|\.png)$' | sed -E 's/\.[a-z]+$//' | jq -R 'tonumber' | jq -s .
else
    echo "[]"
    exit 1
fi

