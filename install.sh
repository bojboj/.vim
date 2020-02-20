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

if [ -d .vimtmp ]; then
    mv .vimtmp .vimtmp-old
fi
mkdir .vimtmp

if [ -f .vimrc ]; then
    mv .vimrc .vimrc-old
fi
ln -s .vim/.vimrc .vimrc

if [ -f .editorconfig ]; then
    mv .editorconfig .editorconfig-old
fi
ln -s .vim/.editorconfig .editorconfig

echo "Successfully set up vim."
