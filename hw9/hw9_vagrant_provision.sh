#!/bin/bash
USER_NAME="hw9"
USER_HOME="/opt"
HOSTS_FILE="/etc/hosts"
SSHD_CONFIG="/etc/ssh/sshd_config"
DNS_PATH="/etc/resolv.conf"
DNS1="8.8.8.8"
DNS2="1.1.1.1"
APP_ADRESS="myownapp.com"
MY_IP="$(curl -s http://ifconfig.me/ip)"
PASSWORD_AUTH_YES="PasswordAuthentication yes"
PASSWORD_AUTH_NO="PasswordAuthentication no"
ROOT_LOGIN_YES="PermitRootLogin without-password"
ROOT_LOGIN_NO="PermitRootLogin no"
#----------USER ADD-----------
function user_add {
    echo "Add $USER_NAME user"
    if grep "$USER_NAME" /etc/passwd
    then
    echo "User already exists"
    else
    sudo useradd -s /bin/bash -d ${USER_HOME}/${USER_NAME} -m -G wheel ${USER_NAME}
    fi
}

#---------ADD USER TO SUDOERS----------
function user_sudoers {
    echo "Add $USER_NAME to sudoers"
    sudo sh -c "echo \"$USER_NAME    ALL=(ALL:ALL) NOPASSWD:ALL\" >> /etc/sudoers" 
}

#---------GENERATE SSH KEY----------
function ssh_key {
    echo "Generate ssh key for: $USER_NAME"
    sudo mkdir -p ${USER_HOME}/${USER_NAME}/.ssh
    sudo chmod 700 ${USER_HOME}/${USER_NAME}/.ssh
    sudo su $USER_NAME
    ssh-keygen -t rsa -f ${USER_HOME}/${USER_NAME}/.ssh/id_rsa -q
}

#-----------UPDATE HOSTS------------
function update_hosts {
    echo "Add adress to /etc/hosts"
    echo 'Check hosts file'
if ! grep -q "^myownapp.com*" "$HOSTS_FILE"
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
    sudo sed -i -- "s/$ROOT_LOGIN_YES/$ROOT_LOGIN_NO/g" $SSHD_CONFIG
}

#--------RESTRICT ROOT ACCESS VIA SSH-----------
function restrict_root_access {
    echo "Restrict root access"
    sudo sed -i -- "s/$PASSWORD_AUTH_YES/$PASSWORD_AUTH_NO/g" $SSHD_CONFIG
}

#------------INSTALL MC,VIM,GIT-------------
function install_apps {
    echo "Installing apps"
    sudo yum install -y mc vim git &> /dev/null
}

#-----------UPDATE DNS--------------
function dns_update {
    echo "Updating DNS"
    sudo chmod 700 $DNS_PATH
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
    if  mkdir /var/log/myownapp &> /dev/null
    then
        sudo mkdir /var/log/myownapp
    else
        echo "Dir exist"
    echo "Change owner"
    sudo chown -R $USER_NAME:root /var/log/myownapp
    fi
}

user_add
user_sudoers
ssh_key
update_hosts
restrict_pass_connection
restrict_root_access
install_apps
dns_update
check_myownapp
external_ip
dir_owner