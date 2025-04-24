#!/bin/bash

# Ensure that the script is run with appropriate permissions
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install applications and tools
echo "Installing applications and tools..."

# Homebrew cask applications
brew install --cask google-chrome
brew install --cask firefox@developer-edition
brew install --cask microsoft-edge
brew install --cask arc
brew install --cask raycast
brew install --cask alt-tab
brew install --cask bitwarden
brew install --cask whatsapp
brew install --cask microsoft-teams
brew install --cask zoom
brew install --cask visual-studio-code
brew install --cask jetbrains-toolbox
brew install --cask warp
brew install --cask postman
brew install --cask fliqlo
brew install --cask docker
brew install --cask command-x
brew install --cask cheatsheet
brew install --cask the-unarchiver
brew install --cask onyx
brew install --cask raspberry-pi-imager
brew install --cask stats
brew install --cask imazing
brew install --cask yubico-authenticator
brew install --cask yubico-yubikey-manager
brew install --cask zotero
brew install --cask todoist
brew install --cask spotify
brew install --cask rustdesk
brew install --cask threema
brew install --cask balenaetcher
brew install --cask keyclu
brew install --cask cleanshot

# Homebrew packages
brew install git
brew install nvm
brew install jenv
brew install gh
brew install mas
brew install ollama

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Node.js 20 LTS using nvm
echo "Installing Node.js 20 LTS..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

# Configure Git
echo "Configuring Git..."
git config --global user.name "Karim Touhami"
git config --global user.email "developer.karimtouhami@gmail.com"

echo "Setup complete!"
