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
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
cp -r nvim-linux-x86_64/* /usr/local/
rm -r nvim-linux-x86_64 nvim-linux-x86_64.tar.gz
echo -ne "\n\n"
nvim --version
echo -ne "\nINSTALLATION COMPLETED!\n\n\n"

echo -ne "INSTALLING FZF PACKAGE...\n\n"
apt install fzf -y
echo -ne "\nINSTALLATION COMPLETED\n\n\n"