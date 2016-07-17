#!/bin/bash
sudo apt-get install python-dev python-pip python3-dev python3-pip

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo pip install neovim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/vim/init.vim ~/.config/nvim/init.vim

vim +PlugInstall +qall

cd ~/.config/nvim/plugged/YouCompleteMe && git submodule update --init --recursive \
  && python install.py --gocode-completer --tern-completer
