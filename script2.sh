#!/bin/bash
home_dir="$HOME"
i=1
for server in $(awk -F: '{print $1}' /"$home_dir"/servers_list)
do
 echo "Server $((i++)) : $server"
done
