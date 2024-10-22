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
brew install --cask raycast
brew install --cask alt-tab
brew install --cask bitwarden
brew install --cask microsoft-teams
brew install --cask visual-studio-code
brew install --cask jetbrains-toolbox
brew install --cask warp
brew install --cask fliqlo
brew install --cask docker

# Homebrew packages
brew install git
brew install nvm
brew install gh # Install GitHub CLI

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Node.js 20 LTS using nvm
echo "Installing Node.js 20 LTS..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

# Set default browser to Chrome
echo "Setting default browser to Google Chrome..."
osascript -e 'tell application "System Preferences"
    reveal anchor "defaultWebBrowser" of pane id "com.apple.preferences.general"
end tell
delay 2
tell application "System Events"
    tell process "System Preferences"
        click pop up button 1 of tab group 1 of window "General"
        delay 1
        click menu item "Google Chrome" of menu 1 of pop up button 1 of tab group 1 of window "General"
    end tell
end tell'

# Configure Git
echo "Configuring Git..."
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Configure system settings
echo "Removing dock auto delay..."
defaults write com.apple.dock autohide-delay -float 0
killall Dock

echo "Setup complete!"
