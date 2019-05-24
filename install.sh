#!/bin/sh

composer install
npm install

cd ~
rm .vimrc
ln -s .vim/.vimrc .vimrc

echo "Done."
