# core utils
alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color'

# Z from rupa/z
. /opt/homebrew/etc/profile.d/z.sh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Keep at the end
eval "$(starship init zsh)"