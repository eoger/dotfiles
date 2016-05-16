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

# Brew command line completion
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions/_brew

# Install command-line applications
brew tap mpv-player/mpv
cat brew-formulae.txt | egrep -v "^\s*(#|$)" | xargs -L 1 brew install
# mpv
brew install --HEAD mpv
brew linkapps mpv

# Install applications
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
cat brewcask-formulae.txt | egrep -v "^\s*(#|$)" | xargs -L 1 brew cask install

# Install pip
sudo easy_install pip

# Install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
./setup-prezto.sh
chsh -s /bin/zsh

# Copy various configuration files
cp -r .config .gitconfig .ssh .zshenv .zshrc .zpreztorc "$HOME"
sudo cp .gitconfig-system /usr/local/etc/gitconfig && sudo chown "$USER" /usr/local/etc/gitconfig

# Sublime text 3 setup
./setup-sublime.sh

# node 5 setup
./setup-node.sh

# fxa dev setup
./setup-fxa-dev.sh

# mozilla gecko dev setup
./setup-gecko-dev.sh

# Cleanup
brew cleanup -p && brew cask cleanup
