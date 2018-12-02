#!/bin/bash

echo 'Set new password for root: '
sudo passwd

echo 'Set no password for sudo thomas'
sudo touch /etc/sudoers.d/thomas

sudo echo 'thomas ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/thomas

echo 'update, upgrade, then install default utilities'
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install --yes vim curl apt-transport-https \
    ca-certificates \
    software-properties-common \
    zsh \
    terminator \
    synaptic \
    htop \
    gnome-tweak-tool \
    slack-desktop \



echo 'Disabling gnome dock'
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

echo 'Installing nvm'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash


echo 'Installing docker and docker-compose'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-compose


echo 'In last but not least !, install oh my zsh <3'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'We should reboot after that, miss mattermost desktop client.'
read
reboot
