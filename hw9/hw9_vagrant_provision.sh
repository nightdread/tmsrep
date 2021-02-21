#!/bin/bash

USER_NAME="hw9"
USER_HOME="/opt"
HOSTS_FILE="/etc/hosts"
SSHD_CONFIG="/etc/ssh/sshd_config"
DNS_PATH="/etc/resolv.conf"
DNS1="8.8.8.8"
DNS2="1.1.1.1"
APP_ADRESS="myownapp.com"
MY_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
#----------USER ADD-----------
function user_add {
    echo "Add $USER_NAME user"
    sudo useradd -m -d $USER_HOME/$USER_NAME -aG wheel $USER_NAME
}

#---------GENERATE SSH KEY----------
function ssh_key {
    echo "Generate ssh key for: $USER_NAME"
    sudo su $USER_NAME
    sudo ssh-keygen -t rsa 
}

#-----------UPDATE HOSTS------------
function update_hosts {
    echo "Add adress to /etc/hosts"
    echo 'Check hosts file'
if ! grep -q "^myapp.com*" "$HOSTS_FILE"
then
 echo 'Add adress to HOSTS'
 echo '127.0.0.1 myownapp.com' >> "$HOSTS_FILE"
else
 echo 'HOSTS complete'
 fi
}

#--------RESTRICT PASS CONNECTION-----------
function restrict_pass_connection {
    echo "Restrict password connection"
    echo 'PasswordAuthentication no' >> $SSHD_CONFIG
}

#--------RESTRICT ROOT ACCESS VIA SSH-----------
function restrict_root_access {
    echo "Restrict root access"
    echo 'PermitRootLogin no' >> $SSHD_CONFIG
}

#------------INSTALL MC,VIM,GIT-------------
function install_apps {
    echo "Installing apps"
    sudo yum update
    sudo yum install -y mc vim git
}

#-----------UPDATE DNS--------------
function dns_update {
    echo "Updating DNS"
    sudo chmod 777 $DNS_PATH
    echo "nameserver $DNS1" | sudo tee $DNS_PATH > /dev/null
    echo "nameserver $DNS2" | sudo tee -a $DNS_PATH > /dev/null
}

#----------CHECK MYOWNAPP.COM CAN BE RESOLVED----------
function check_myownapp {
    echo "Check myownapp.com availability"
    if ping -c 1 $APP_ADRESS &> /dev/null
    then
        echo "Adress available"
    else
        echo "Adress unavailable"
        update_hosts
    fi
}

#-----------PRINT WHITE IP------------
function external_ip {
    echo "My IP is: $MY_IP"
}

#---------CREATE DIR & CHANGE OWNER-------
function dir_owner {
    echo "Create dir"
    sudo mkdir /var/log/myownapp
    echo "Change owner"
    sudo chown -R $USER_NAME:wheel /var/log/myownapp
}

user_add
ssh_key
update_hosts
restrict_pass_connection
restrict_root_access
install_apps
dns_update
check_myownapp
external_ip
dir_owner