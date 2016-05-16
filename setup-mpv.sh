#!/usr/bin/env bash
set -e -o xtrace # Exit on error and print executed commands

brew install mpv --HEAD --with-bundle
brew linkapps mpv
CONFIG="$HOME"/.config
mkdir -p "$CONFIG"
ln -sf "$PWD"/mpv "$CONFIG"/mpv
