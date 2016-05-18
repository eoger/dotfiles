#!/usr/bin/env bash
set -e -v # Exit on error and print executed commands

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
nvm unalias default
