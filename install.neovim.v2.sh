#!/bin/bash
sudo apt-get install python3-dev python3-pip
sudo apt-get install build-essential cmake
sudo apt-get install golang
sudo apt-get install nodejs npm
# TODO: Local Golang
# TODO: Local Node NPM
# TODO: 
sudo npm install -g n yarn
sudo n install stable
# install conda
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
curl https://sh.rustup.rs -sSf | sh
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.cargo/bin:$PATH"
cargo install ripgrep
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
npm install -g typescript


cd ~
sudo apt-get update 
sudo apt-get install neovim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/vim/init.vim ~/.config/nvim/init.vim

nvim +PlugInstall +qall

cd ~/.config/nvim/plugged/YouCompleteMe && git submodule update --init --recursive \
  && python install.py --gocode-completer --rust-completer --js-completer
