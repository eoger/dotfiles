#!/usr/bin/env bash
set -e -o xtrace # Exit on error and print executed commands

open macappstore://itunes.apple.com/app/id497799835?mt=12 # Install Xcode
echo "Press any key once Xcode is installed"; read

brew install mercurial ccache terminal-notifier

# Mnage multiple mozconfigs easily
sudo pip install mozconfigwrapper
ln -sf "$PWD"/.mozconfigs "$HOME"

ccache --max-size 8G
curl https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py > "$HOME"/bootstrap.py && python "$HOME"/bootstrap.py

# Install git cinnabar and moz-git-tools
git clone https://github.com/glandium/git-cinnabar.git "$HOME"/git-cinnabar
git clone https://github.com/mozilla/moz-git-tools.git "$HOME"/moz-git-tools

# See https://github.com/glandium/git-cinnabar/wiki/Mozilla:-A-git-workflow-for-Gecko-development
cp -r gecko "$HOME"
cd "$HOME"/gecko
git init
mv .gitconfig .git/config
git remote update
git checkout central/default
./mach mercurial-setup # We need this at least for the MozReview Git Tools
git mozreview configure
