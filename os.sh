#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Use Dark theme
defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle Dark

# Disable the “Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Set sidebar icon size to small
## Medium = 2, large = 3
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Set the icon size of Dock items to 40 pixels
defaults write com.apple.dock tilesize -int 40

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Reset Launchpad, but keep the desktop wallpaper intact
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true
# Don't show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# --------------–-------–--------–--------–-------–--–-----
# SSD-specific tweaks
# --------------–-------–--------–--------–-------–--–-----
# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Disable the sudden motion sensor as it's not useful for SSDs
sudo pmset -a sms 0

# --------------–-------–--------–--------–-------–--–-----
# Kill affected applications
# --------------–-------–--------–--------–-------–--–-----
for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."