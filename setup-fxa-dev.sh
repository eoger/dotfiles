#!/usr/bin/env bash
set -e -v # Exit on error and print executed commands

# Dependencies
brew install gmp redis graphicsmagick
sudo pip install virtualenv

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 0.10
npm install -g npm@2.4
nvm unalias default

git clone https://github.com/mozilla/fxa-local-dev.git "$HOME"/fxa/fxa-local-dev
cd "$HOME"/fxa/fxa-local-dev
npm i
./pm2 kill
