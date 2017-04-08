#!/usr/bin/env bash
set -e -v # Exit on error and print executed commands

# Dependencies
brew install gmp redis graphicsmagick
sudo pip install virtualenv

set +ev
echo "source $HOME/.nvm/nvm.sh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
CMD="nvm install 4.8"; echo $CMD; eval $CMD;
CMD="nvm unalias default"; echo $CMD; eval $CMD
set -ev

git clone https://github.com/mozilla/fxa-local-dev.git "$HOME"/fxa
cd "$HOME"/fxa
npm i
./pm2 kill
