#!/usr/bin/env bash

# Dependencies
brew install gmp redis graphicsmagick
sudo pip install virtualenv

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 4
npm install -g npm
nvm install 0.10
npm install -g npm
nvm unalias default

git clone https://github.com/mozilla/fxa-local-dev.git "$HOME"/fxa/fxa-local-dev
cd "$HOME"/fxa/fxa-local-dev
npm i
./pm2 kill