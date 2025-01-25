#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Update apt list
echo -ne "UPDATING SYSTEM APT LIST...\n\n"
apt update
echo -ne "\nUPDATE COMPLETED!\n\n\n"

# Install Tmux
echo -ne "INSTALLING TMUX PACKAGE...\n\n"
apt install tmux -y
cp ./tmux/tmux.conf /etc/tmux.conf
echo -ne "\nINSTALLATION COMPLETED!\n\n\n"

# Install Vim
echo -ne "INSTALLING VIM PACKAGE...\n\n"
apt install neovim -y
echo -ne "\nINSTALLATION COMPLETED!\n\n\n"
