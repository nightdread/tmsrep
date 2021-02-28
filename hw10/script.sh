#!/bin/bash
CURRENT_PATH = "$PWD"
#---------FIND *.sh files--------
function find_sh {
    echo "Find *.sh files in $CURRENT_PATH"
    sudo find $CURRENT_PATH -type f -name "*.sh"
}

#---------FIND *.png files-------
function find_png {
    echo "Find *.png files in $CURRENT_PATH"
    sudo find $CURRENT_PATH -type f -name "*.png"
}
find_sh
find_png
