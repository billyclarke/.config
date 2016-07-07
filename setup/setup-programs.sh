#! /bin/bash

# Add Google Chrome stable repository to apt
echo 'Adding Google Chrome stable repository to apt'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

echo 'Running apt-get update'
sudo apt-get update

echo 'Installing specified packages'
sudo apt-get -y install \
       git \
       google-chrome-stable \
       htop \
       i3-wm \
       redshift \
       shutter \
       vim \
       vlc
