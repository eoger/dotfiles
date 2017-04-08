#!/usr/bin/env bash
set -e -v # Exit on error and print executed commands

brew cask install mpv
CONFIG="$HOME"/.config
mkdir -p "$CONFIG"
ln -sf "$PWD"/mpv "$CONFIG"/mpv
