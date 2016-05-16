#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 5
npm install -g npm
nvm unalias default
