#!/bin/sh

if [ -x "`command -v composer`" ]; then
    echo "Installing composer packages."
    composer install
else
    echo "composer is not available. skipping composer packages."
fi

if [ -x "`command -v npm`" ]; then
    echo "Installing npm packages."
    npm install
else
    echo "npm is not available. skipping npm packages."
fi

cd ~

if [ -f .vimrc ]; then
    mv .vimrc .vimrc-old
fi
ln -s .vim/.vimrc .vimrc

if [ -f .editorconfig ]; then
    mv .editorconfig .editorconfig-old
fi
ln -s .vim/.editorconfig .editorconfig


if [ -d .config/nvim ]; then
    mv .config/nvim .config/nvim-old
fi
mkdir .config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" >> .config/nvim/init.vim

echo "Successfully set up neovim."
