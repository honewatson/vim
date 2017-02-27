#!/bin/bash
sudo apt-get install python-dev python-pip python3-dev python3-pip

# install conda
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim


sudo pip install neovim
# brew install neovim

cd ~


wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh

# Install Anaconda
bash Anaconda3-4.3.0-Linux-x86_64.sh



curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/vim/init.vim ~/.config/nvim/init.vim

nvim +PlugInstall +qall

conda install libgcc

cd ~/.config/nvim/plugged/YouCompleteMe && git submodule update --init --recursive \
  && python install.py --gocode-completer --tern-completer
