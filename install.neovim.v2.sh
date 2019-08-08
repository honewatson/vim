#!/bin/bash
sudo apt install python3-dev python3-pip -y
sudo apt install git
sudo apt install build-essential cmake -y
sudo apt install golang -y
sudo apt install nodejs npm -y
sudo npm install -g n yarn
sudo n  stable
install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3*
mkdir ~/bin
echo "export PATH=~/.local/bin:~/.npm/bin:~/go/bin:~/bin:$PATH" >> ~/.bashrc-source
echo "source ~/.bashrc-source" >> ~/.bashrc
source ~/.bashrc-source
cd ~/bin
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
ln -s ~/bin/nvim ~/bin/vim
curl https://sh.rustup.rs -sSf | sh
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc-source
export PATH="$HOME/.cargo/bin:$PATH"
cargo install ripgrep
bash tmux-setup.sh
sudo apt install fd-find -y
sudo apt install neovim -y
conda install pip
pip install neovim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo npm install -g typescript
cd ~
ln -s ~/vim/basic/.vim/colors/monokai-phoenix.vim ~/.config/nvim/colors/monokai-phoenix.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rsync -av ~/vim/basic/ ~/.config/nvim/
ln -s ~/vim/basic/.vimrc ~/.config/nvim/init.vim
nvim +PlugInstall +qall
git config --global core.editor "vim"
cd ~/.config/nvim/plugged/YouCompleteMe && git submodule update --init --recursive \
  && python install.py --rust-completer

# Need to add bat and fd-find
# fd -e md | fzf --preview 'bat --style=numbers --color=always {}'
