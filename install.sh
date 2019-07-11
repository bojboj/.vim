#!/bin/sh

echo "Installing composer packages."
composer install
echo ""

echo "Installing npm packages."
npm install
echo ""

cd ~
rm .vimrc
ln -s .vim/.vimrc .vimrc

rm .editorconfig
ln -s .vim/.editorconfig .editorconfig

rm -rf .config/nvim
mkdir .config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" >> .config/nvim/init.vim

echo "Successfully set up neovim."
