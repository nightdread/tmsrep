#!/bin/bash
CURRENT_PATH = "$PWD"
#---------FIND *.sh files--------
function find_sh {
    echo "Find *.sh files in $CURRENT_PATH"
    find "$CURRENT_PATH" -type f -name "*.sh"
}

find_sh
