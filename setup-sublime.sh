#!/usr/bin/env bash
set -e -o xtrace # Exit on error and print executed commands

brew cask install sublime-text3

# Install Package Control + preferences
SUBLIME_CONFIG="$HOME"/Library/"Application Support"/"Sublime Text 3"
SUBLIME_INSTALLED_PACKAGES="$SUBLIME_CONFIG"/"Installed Packages"
SUBLIME_PREFERENCES="$SUBLIME_CONFIG"/Packages/User
mkdir -p "$SUBLIME_INSTALLED_PACKAGES"
mkdir -p "$SUBLIME_PREFERENCES"
wget https://packagecontrol.io/Package%20Control.sublime-package -P "$SUBLIME_INSTALLED_PACKAGES"
cp sublime-text/* "$SUBLIME_PREFERENCES"
