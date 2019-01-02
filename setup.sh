#!/usr/bin/env bash
set -e -v # Exit on error and print executed commands

# Sudo keepalive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
   xcode-select --install
fi

# Install Homebrew
if ! brew -v &>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install brew/brew-cask apps
brew bundle

# pip
sudo easy_install pip

# Copy and link various configuration files
ln -sf "$PWD"/.ssh/config "$HOME"/.ssh
ln -sf "$PWD"/.gitconfig "$HOME"
ln -sf "$PWD"/.gitignore_global "$HOME"
sudo ln -sf "$PWD"/.gitconfig-system /usr/local/etc/gitconfig && sudo chown -h "$USER" /usr/local/etc/gitconfig

# mpv setup
./setup-mpv.sh

# Sublime text 3 setup
./setup-sublime.sh

# node latest
./setup-node.sh

# mozilla gecko dev setup
./setup-gecko-dev.sh

# Prezto setup
./setup-prezto.sh

# Cleanup
brew cleanup -p && brew cask cleanup

echo "Done! Don't forget to set-up manually the files in the non-automated dir"
