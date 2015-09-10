#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install vim  -y
apt-get install python-software-properties  -y
apt-get install unzip -y
apt-get install zip -y
apt-get install build-essential -y
apt-get install python-dev -y
apt-get install libxml2-dev -y
apt-get install libxslt-dev -y
apt-get install python-pip -y
apt-get install python-imaging -y
apt-get install python-imaging-tk -y
apt-get install mercurial -y
apt-get install libcurl4-gnutls-dev -y
apt-get install libexpat1-dev -y
apt-get install gettext -y
apt-get install libz-dev -y
apt-get install libssl-dev -y
apt-get install git -y
apt-get install mysql-client -y
apt-get install libmysqlclient-dev -y
apt-get install python-dev -y
apt-get install python-mysqldb -y
apt-get install cmake -y
apt-get install libboost1.54-all-dev -y
apt-get install silversearcher-ag -y
apt-get install libffi-dev -y
apt-get install cmake -y
apt-get install nodejs -y
apt-get install npm -y
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update -y
apt-get install postgresql-9.4 -y
apt-get install postgresql-server-dev-9.4 -y
apt-get install python-lxml -y
apt-get install exuberant-ctags -y
ln -s /usr/bin/nodejs /usr/bin/node && npm install -g bower grunt-cli

pip install --upgrade pip
pip install flake8
pip install virtualenv
pip install virtualenvwrapper
pip install azure
pip install boto
pip install boto3
pip install cheetah
pip install cython
pip install cytoolz
pip install django
pip install wagtail
pip install fabric
pip install flask
pip install flask-login
pip install flask-wtf
pip install gdata
pip install suds
pip install gunicorn
pip install mysql-python
pip install pep8
pip install pillow
pip install psycopg2
pip install pyflakes
pip install pygments
pip install supervisor
pip install toolz
pip install tornado
pip install autopep8

mkdir ~/installs
cd ~/installs && \
wget https://storage.googleapis.com/golang/go1.4.2.src.tar.gz && tar -xzvf go1.4.2.src.tar.gz && \
cd go/src && ./all.bash
cd ~/installs && /usr/bin/env python -V 2>&1 | grep 2.7 && \
wget https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.25.zip && \
unzip go_appengine_sdk_linux_amd64-1.9.25.zip

echo "export GOPATH=~/go" >> ~/.bashrc
echo "export PATH=~/installs/go/bin:/go/bin:/installs/go_appengine:$PATH" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "export PROJECT_HOME=$HOME/Devel" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
mkdir ~/Devel
source ~/.bashrc
mkvirtualenv main

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive \
 && python install.py --gocode-completer
git config --global credential.helper 'cache --timeout=86400'
git clone https://github.com/honewatson/hon-snippet.git ~/.vim/UltiSnips
git clone https://github.com/honewatson/vim.git
mv vim/.vimrc ~/.vimrc
mv -f ~/vim/molokai.vim ~/.vim/colors/molokai.vim
vim +PluginInstall +qall
