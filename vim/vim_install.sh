#!/bin/bash

mkdir ~/.vim
cd ~/.vim
touch vimrc
ln -s ~/.vim/vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git

