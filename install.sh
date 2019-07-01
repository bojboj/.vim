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

echo "Successfully set up vim."
