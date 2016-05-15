#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export PATH=${PATH}:/Users/eoger/git-cinnabar:/Users/eoger/.mozbuild/version-control-tools/git/commands:/Users/eoger/moz-git-tools
export CCACHE_COMPRESS=""
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
