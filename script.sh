#!/bin/bash
#output directories
FIND_PATH="PATH_TO_MT_DIR"
echo 'Dir list in $FIND_PATH'
ls -la -d */ | awk '{print $9, $6, $7, $8}' > hw6.txt
cat hw6.txt
#add adress to hosts
echo 'Check hosts file'
if ! grep -q myapp.com.* "/etc/hosts"
then
 echo 'Dobavlenie adresa'
 echo '192.168.3.1 myapp.com' >> /etc/hosts
else
 echo 'HOSTS complete'
 fi 
