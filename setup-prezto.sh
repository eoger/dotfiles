#!/usr/bin/env zsh
set -e -o xtrace # Exit on error and print executed commands

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
ln -sf "$PWD"/.zshenv "$PWD"/.zshrc "$PWD"/.zpreztorc "$HOME"
chsh -s /bin/zsh
