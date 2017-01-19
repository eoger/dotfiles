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

source /Users/eoger/.cargo/env

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
# These 2 commands can work with absolute paths!
alias xpc="python -c 'import os, sys; os.system(\"./mach xpcshell-test \" + os.path.relpath(*sys.argv[1:]))'"
alias mochi="python -c 'import os, sys; os.system(\"./mach mochitest \" + os.path.relpath(*sys.argv[1:]))'"

export NVM_DIR="/Users/eoger/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
