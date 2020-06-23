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
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT
export RUSTC_WRAPPER="sccache"

# Application Services libs
export SQLCIPHER_LIB_DIR=/Users/eoger/application-services/libs/desktop/darwin/sqlcipher/lib
export SQLCIPHER_INCLUDE_DIR=/Users/eoger/application-services/libs/desktop/darwin/sqlcipher/include
export NSS_STATIC=1
export NSS_DIR=/Users/eoger/application-services/libs/desktop/darwin/nss
