#!/bin/bash

# Enable ssh password authentication
echo "Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Set Root password
echo "Set root password"
echo "admin" | passwd --stdin root >/dev/null 2>&1

# Set local user account
echo "Set up local user account"
useradd -m -s /bin/bash mra
echo "admin" | passwd --stdin mra >/dev/null 2>&1
echo "mra ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Update bashrc file
echo "export TERM=xterm" >> /etc/bashrc
