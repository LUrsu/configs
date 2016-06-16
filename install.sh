#!/bin/sh

LINK=0

while getopts "hl?:" opt; do
    case $opt in
        h|\?)
            echo "-l        link the config files to repository\n"
            exit 0
            ;;
        l)
            LINK=1
            ;;
    esac
done

echo installing awesome
add-apt-repository ppa:klaus-vormweg/awesome
apt-get update
apt-get install awesome

# add config files
mkdir -p "$HOME/.config/awesome"
if [ $LINK -eq 0 ]; 
then
    cp rc.lua "$HOME/.config/awesome"
else
    ln -s rc.lua "$HOME/.config/awesome"
fi

echo installing oh-my-zsh
apt-get install zsh
apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# switch default shell to zsh will still need a restart later
chsh -s `which zsh`

# add the config files
if [ $LINK -eq 0 ];
then
    cp .zshrc $HOME
else
    ln -s .zshrc $HOME
fi

echo setting up vim configs
if [ $LINK -eq 0 ];
then
    cp .vimrc $HOME
else
    ln -s .vimrc $HOME
fi
# install all of the vim plugins
vim +PlugInstall

# restart the terminal for zsh change to take affect
shutdown -r 0
