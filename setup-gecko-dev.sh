#!/usr/bin/env bash

brew install mercurial ccache terminal-notifier

# Mnage multiple mozconfigs easily
sudo pip install mozconfigwrapper
cp -r .mozconfigs "$HOME"

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
