#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload bashcompinit
bashcompinit
source "$HOME"/gecko/python/mach/bash-completion.sh

source /usr/local/bin/mozconfigwrapper.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

# Disable autocorrect
unsetopt correct
# Gecko stuff
alias rsp="~/Documents/makeblankprofile.sh"
alias b="./mach build"
alias bf="./mach build faster"
alias r="./mach run"
alias br="./mach build && ./mach run"
alias bfr="./mach build faster && ./mach run"
alias bp="./mach build && ./mach package"
