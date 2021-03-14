#!/bin/bash
CURRENT_PATH="$PWD"
#---------FIND *.sh & *.png files--------
function find_files {
    echo "Find *.sh files in $CURRENT_PATH"
    sudo find "$CURRENT_PATH" -iregex '.*\.\(png\|sh\)$'
}

find_files
