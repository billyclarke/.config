#! /bin/bash

# Copyright William Clarke, 2016

# This script assumes setup/setup-git-config.sh has already been run.
# In particular:
#   1. .config should be a git repository
#   2. ~/.config/setup should contain the files:
#     a) setup-launcher.sh
#     a) setup-programs.sh
#     b) setup-symlinks.sh


# Get sudo rights, or stop if not given
sudo echo 'Starting setup' || exit

# git pull .config
echo -e '\n\n\nGit pulling latest .config\n\n\n'
git -C ~/.config pull origin master

# apt-get update and upgrade
echo -e '\n\n\napt-get update\n\n\n'
sudo apt-get update
echo -e '\n\n\napt-get upgrade\n\n\n'
sudo apt-get upgrade -y

# Generate a 2048 bit RSA Key
echo -e '\n\n\nGenerating RSA Key\n\n\n'
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa

# Run setup-symlinks
echo -e '\n\n\nSetting up config symlinks\n\n\n'
source ~/.config/setup/setup-symlinks.sh

# Run setup-programs
echo -e '\n\n\nInstalling programs\n\n\n'
source ~/.config/setup/setup-programs.sh

# Run setup-launcher
echo -e '\n\n\nConfiguring Launcher\n\n\n'
source ~/.config/setup/setup-launcher.sh


# Manual steps
echo -e '\n\n\nTODO:'
echo -e '\nEnable Workspaces in System Settings'
echo -e '\nAdd SSH key to GitHub and BitBucket:'
cat ~/.ssh/id_rsa.pub
echo -e '\nLog in to Google Chrome'

