#!/usr/bin/env bash
set -e -v # Exit on error and print executed commands

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

set +ev
echo "source $HOME/.nvm/nvm.sh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
CMD="nvm install node"; echo $CMD; eval $CMD;
CMD="nvm unalias default"; echo $CMD; eval $CMD
set -ev
