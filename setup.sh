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
cp -r .config .gitconfig .ssh .zshenv .zshrc .zpreztorc "$HOME"
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
nvm unalias default

# Install pip
sudo easy_install pip

# fxa dev setup
./setup-fxa-dev.sh

# mozilla gecko dev setup
./setup-gecko-dev.sh

# Cleanup
brew cleanup -p && brew cask cleanup
