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

export PATH=${PATH}:"$HOME/.mozbuild/android-sdk-macosx/platform-tools:$HOME/.mozbuild/android-sdk-macosx/tools:$HOME/git-cinnabar:$HOME/.mozbuild/version-control-tools/git/commands:$HOME/moz-git-tools"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export ANDROID_SDK_ROOT="$HOME/.mozbuild/android-sdk-macosx"
export BUILDWITH_COMMAND="export MOZCONFIG=#1 && launchctl setenv MOZCONFIG #1"
