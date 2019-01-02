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

export PATH=${PATH}:"$HOME/.cargo/bin:$HOME/.mozbuild/android-sdk-macosx/platform-tools:$HOME/.mozbuild/android-sdk-macosx/tools:$HOME/.mozbuild/version-control-tools/git/commands:$HOME/moz-git-tools:$HOME/arcanist/bin:$HOME/android-ndk-r15c:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export ANDROID_SDK_ROOT="$HOME/.mozbuild/android-sdk-macosx"
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_NDK_HOME="$HOME/android-ndk-r15c"
export ANDROID_NDK_TOOLCHAIN_DIR="$HOME/android-ndk-toolchain"
export BUILDWITH_COMMAND="export MOZCONFIG=#1 && launchctl setenv MOZCONFIG #1"
