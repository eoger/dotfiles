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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install brew/brew-cask apps
brew bundle

# Copy and link various configuration files
ln -sf "$PWD"/.ssh/config "$HOME"/.ssh
ln -sf "$PWD"/.gitconfig "$HOME"
ln -sf "$PWD"/.gitignore_global "$HOME"
sudo ln -sf "$PWD"/.gitconfig-system /usr/local/etc/gitconfig && sudo chown -h "$USER" /usr/local/etc/gitconfig

# Prezto setup
./setup-prezto.sh

# Cleanup
brew cleanup

echo "Done! Don't forget to set-up manually the files in the non-automated dir"
