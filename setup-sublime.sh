#!/usr/bin/env bash
set -e -v # Exit on error and print executed commands

brew cask install sublime-text

# Install Package Control + preferences
SUBLIME_CONFIG="$HOME"/Library/"Application Support"/"Sublime Text 3"
SUBLIME_INSTALLED_PACKAGES="$SUBLIME_CONFIG"/"Installed Packages"
SUBLIME_PACKAGES="$SUBLIME_CONFIG"/Packages
mkdir -p "$SUBLIME_INSTALLED_PACKAGES"
wget -nc https://packagecontrol.io/Package%20Control.sublime-package -P "$SUBLIME_INSTALLED_PACKAGES"

mkdir -p "$SUBLIME_PACKAGES"
ln -sf "$PWD"/sublime-text "$SUBLIME_PACKAGES"/User
