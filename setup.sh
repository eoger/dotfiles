set -e # Exit on error
set -o xtrace # Print executed commands

# Sudo keepalive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Xcode Command Line Tools
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install command-line applications
brew install git
brew install mercurial
brew install ccache
brew install python
# mpv
brew tap mpv-player/mpv
brew install --HEAD mpv
brew linkapps mpv

# Install applications
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew cask install caffeine # Keep mac awake
brew cask install flux
brew cask install iterm2 # Better terminal
brew cask install skype
brew cask install spotify
brew cask install spotify-notifications
brew cask install spectacle # Window management
brew cask install textual # Best IRC client
brew cask install chitchat # Whatsapp desktop client
brew cask install messenger # FB Messenger desktop client
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install feeds
brew cask install firefox-nightly
brew cask install firefox
brew cask install google-chrome
brew cask install steam
brew cask install go2shell
brew cask install imageoptim
brew cask install the-unarchiver
brew cask install google-photos-backup
brew cask install hubic
brew cask install sublime-text3
brew cask install transmission
brew cask install viscosity
brew cask install vmware-fusion
# Quicklook plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlimagesize
brew cask install qlvideo
# Fonts
brew tap caskroom/fonts
brew cask install font-inconsolata

# Brew all done
brew update && brew upgrade && brew cleanup && brew cask cleanup

# Install Oh My Zsh
brew install wget
brew install zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

# Copy various configuration files
cp -r .config .gitconfig .zshenv .zshrc "$HOME"

# Sublime text

# Add a command-line subl command to open Sublime Text
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl || true
# Install Package Control + preferences
SUBLIME_CONFIG="$HOME"/Library/"Application Support"/"Sublime Text 3"
SUBLIME_INSTALLED_PACKAGES="$SUBLIME_CONFIG"/"Installed Packages"
SUBLIME_PREFERENCES="$SUBLIME_CONFIG"/Packages/User
mkdir -p "$SUBLIME_INSTALLED_PACKAGES"
mkdir -p "$SUBLIME_PREFERENCES"
wget https://sublime.wbond.net/Package%20Control.sublime-package -P "$SUBLIME_INSTALLED_PACKAGES"
cp .sublime/* "$SUBLIME_PREFERENCES"

# Install moz-git-tools
git clone https://github.com/mozilla/moz-git-tools.git "$HOME"/moz-git-tools

# Install nvm + npm + Node 0.10 (for FxA)
brew install nvm
source $(brew --prefix nvm)/nvm.sh
nvm install 0.10
nvm alias default 0.10

# Install npm global packages
npm install -g npm@latest # Update npm
npm install -g bower
npm install -g eslint
npm install -g grunt-cli
npm install -g webpack

# FxA Dev Dependencies
brew install gmp redis graphicsmagick
sudo easy_install pip && sudo pip install virtualenv

# gecko-dev Stuff
ccache --max-size 8G
curl https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py > "$HOME"/bootstrap.py && python bootstrap.py
