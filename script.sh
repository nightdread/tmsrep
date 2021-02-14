#!/bin/bash
#output directories
FIND_PATH="$PWD"
HOME_NAME="$USER"
CURRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
FILE_NAME=HW6.txt
NEW_FILE_NAME=$FILE_NAME.$CURRENT_TIME
echo Dir list in $FIND_PATH
ls -la -d | awk '{print $9, $6, $7, $8}' > /home/$HOME_NAME/$NEW_FILE_NAME
echo "New file name: " "$NEW_FILE_NAME"
echo $CURRENT_TIME >> /home/$HOME_NAME/$NEW_FILE_NAME
cat /home/$HOME_NAME/$NEW_FILE_NAME
#add adress to hosts
echo 'Check hosts file'
if ! grep -q myapp.com.* "/etc/hosts"
then
 echo 'Dobavlenie adresa'
 echo '192.168.3.1 myapp.com' >> /etc/hosts
else
 echo 'HOSTS complete'
 fi
