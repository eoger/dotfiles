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

export PATH="$HOME/.cargo/bin"
export PATH="$PATH:$HOME/arcanist/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_NDK_HOME="$HOME/android-ndk-r15c"
export ANDROID_NDK_TOOLCHAIN_DIR="$HOME/android-ndk-toolchain"
export BUILDWITH_COMMAND="export MOZCONFIG=#1 && launchctl setenv MOZCONFIG #1"
