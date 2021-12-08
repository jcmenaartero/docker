#!/bin/bash

set -e

newUser(){
    useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 
    #echo "root:${PASSWD}" | chpasswd
    echo "${USUARIO}:${PASSWD}" | chpasswd
}

config_Sudoers(){
    echo "${USUARIO} ALL=(ALL) PASSWD: ALL" >> /etc/sudoers
}

config_ssh(){
    #sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
    #sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
    if [ ! -d /home/${USUARIO}/.ssh ]
    then
        mkdir /home/${USUARIO}/.ssh
        cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
    fi
}

main(){
    newUser
    config_Sudoers
    config_ssh
}

main