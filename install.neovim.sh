#!/bin/bash
sudo apt-get install python-dev python-pip python3-dev python3-pip
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
curl https://sh.rustup.rs -sSf | sh
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.cargo/bin:$PATH"
cargo install ripgrep
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
#sudo apt-get update
#sudo apt-get install neovim
npm install -g typescript

#sudo pip install neovim
# brew install neovim

cd ~

wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh

# Install Anaconda
bash Anaconda3-4.3.0-Linux-x86_64.sh
export PATH="$HOME/bin:$PATH"
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc

export PATH="$HOME/anaconda3/bin:$PATH"
/$HOME/anaconda3/bin/conda install pip

/home/$USER/anaconda3/bin/pip install --upgrade pip
/home/$USER/anaconda3/bin/pip install setuptools
sudo apt-get update 
sudo apt-get install neovim
/home/$USER/anaconda3/bin/pip install neovim
cd ~
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"
echo 'export PATH="$HOME/neovim/bin:$PATH"' >> ~/.bashrc
sudo apt-get install ocaml aspcud darcs mercurial opam

echo 'eval `opam config env`' > ~/.bashrc
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/vim/init.vim ~/.config/nvim/init.vim

/home/$USER/anaconda3/bin/conda install libgcc

nvim +PlugInstall +qall

cd ~/.config/nvim/plugged/YouCompleteMe && git submodule update --init --recursive \
  && python install.py --gocode-completer --rust-completer --js-completer
