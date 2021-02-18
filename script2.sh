#!/bin/bash
#1. Servers list
home_dir="$HOME"
i=1
for server in $(awk -F: '{print $1}' /"$home_dir"/servers_list)
do
 echo "Server $((i++)) : $server"
done
#2. SSH command
#echo "Enter username: "
#read -r username
#echo "Enter server adress: "
#read -r adress
#echo "Choose command: "
#read -r command
#ssh  "$username"@"$adress" "echo | awk -F: '{print $""$command""}' $HOME/MyProject/tmsrep/variables_file"
#3. Uppercase
awk 'NR==1 {print toupper($1)}' $HOME/MyProject/tmsrep/test.txt
#4. Lowercase
awk 'NR==1 {print tolower($1)}' $HOME/MyProject/tmsrep/test.txt
#5. Work with array.
. /home/nightdread/MyProject/tmsrep/variables_file
echo "$SENT"
