#!/usr/bin/env bash

set -e # Exit on error
set -o xtrace # Print executed commands

# Sudo keepalive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Xcode Command Line Tools
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install command-line applications
brew install $(< brew-formulae.txt)
# mpv
brew tap mpv-player/mpv
brew install --HEAD mpv
brew linkapps mpv

# Install applications
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew cask install $(< brewcask-formulae.txt)

# Install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
./setup-prezto.sh
chsh -s /bin/zsh

# Brew command line completion
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions/_brew

# Copy various configuration files
cp -r .config .mozconfigs .gitconfig .ssh .zshenv .zshrc .zpreztorc "$HOME"
sudo cp .gitconfig-system /usr/local/etc/gitconfig && sudo chown "$USER" /usr/local/etc/gitconfig

# Sublime text

# Add a command-line subl command to open Sublime Text
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl || true
# Install Package Control + preferences
SUBLIME_CONFIG="$HOME"/Library/"Application Support"/"Sublime Text 3"
SUBLIME_INSTALLED_PACKAGES="$SUBLIME_CONFIG"/"Installed Packages"
SUBLIME_PREFERENCES="$SUBLIME_CONFIG"/Packages/User
mkdir -p "$SUBLIME_INSTALLED_PACKAGES"
mkdir -p "$SUBLIME_PREFERENCES"
wget https://sublime.wbond.net/Package%20Control.sublime-package -P "$SUBLIME_INSTALLED_PACKAGES"
cp .sublime/* "$SUBLIME_PREFERENCES"

# Install nvm + npm + Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 5
npm install -g npm
nvm install 4
npm install -g npm
nvm install 0.10
npm install -g npm
nvm unalias default # Super slow zsh startup otherwise :(

# FxA Dev Dependencies
brew install gmp redis graphicsmagick
sudo easy_install pip && sudo pip install virtualenv

# Allows to manage multiple mozconfigs
sudo pip install mozconfigwrapper

# mozilla-central setup
ccache --max-size 8G
curl https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py > "$HOME"/bootstrap.py && python bootstrap.py

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
cd -

# Cleanup
brew cleanup -p && brew cask cleanup
