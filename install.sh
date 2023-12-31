#!/bin/bash

while true; do
    read -p "Do you wish to install? this may overwrite existing config files, Y or N" yn
    case $yn in
        [Yy]* ) config_load; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done



config_load () {
  echo Cloning Repo
  git clone https://github.com/JimmyBlackley/dotfiles configclone
  cd configclone
  rm -r .git
  echo Checking configs
  mkdir ~/.config
  shopt -s dotglob
  mv nvim/* ~/.config/ 
  mv tmux.conf ~/.tmux.conf
}
