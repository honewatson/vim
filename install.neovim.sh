#!/bin/bash
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install build-essential cmake
sudo apt-get install golang
sudo apt-get install nodejs npm
sudo npm install -g n yarn
sudo n install stable
# install conda
sudo add-apt-repository ppa:neovim-ppa/unstable
curl https://sh.rustup.rs -sSf | sh
cargo install ripgrep
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl https://sh.rustup.rs -sSf | sh
#sudo apt-get update
#sudo apt-get install neovim
npm install -g typescript

#sudo pip install neovim
# brew install neovim

cd ~

wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh

# Install Anaconda
bash Anaconda3-4.3.0-Linux-x86_64.sh

exit
sudo conda install pip
sudo pip install --upgrade pip
sudo pip install setuptools
sudo apt-get update 
sudo apt-get install neovim
sudo pip install neovim

apt-get install ocaml aspcud darcs mercurial opam

echo 'eval `opam config env`' > ~/.bashrc
exit
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/vim/init.vim ~/.config/nvim/init.vim

conda install libgcc

nvim +PlugInstall +qall

cd ~/.config/nvim/plugged/YouCompleteMe && git submodule update --init --recursive \
  && python install.py --gocode-completer --rust-completer --js-completer
