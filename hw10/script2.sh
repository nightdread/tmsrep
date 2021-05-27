#!/bin/bash
CURRENT_PATH="$PWD"
#---------FIND *.sh & *.png files--------

echo "Enter file type:"
read $type


function find_files {
    echo "Find *.sh files in $CURRENT_PATH"
    sudo find -type f $type
}

find_files
