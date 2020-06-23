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
alias b="./mach build"
alias bf="./mach build faster"
alias r="./mach run"
alias br="./mach build && ./mach run"
alias bfr="./mach build faster && ./mach run"
alias bp="./mach build && ./mach package"
alias bw="./mach build && ./mach watch"
alias w="./mach watch"
# These 2 commands can work with absolute paths!
alias xpc="python -c 'import os, sys; os.system(\"./mach xpcshell-test \" + os.path.relpath(*sys.argv[1:]))'"
alias mochi="python -c 'import os, sys; os.system(\"./mach mochitest \" + os.path.relpath(*sys.argv[1:]))'"
# Rust
alias check="cargo check --all-features --tests --examples"
alias clippy="cargo clippy --all --all-targets --all-features -- -D warnings"

# Default to python3
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3

export NVM_DIR="/Users/eoger/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Look for .nvmrc in directories.  If found, change to that version of node.
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Doesn't work when in .zshenv
export EDITOR="subl -n -w"
export GPG_TTY=$(tty)

. /usr/local/etc/profile.d/z.sh
