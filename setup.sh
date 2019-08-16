#!/usr/bin/env bash
sudo -v

echo "→ Checking homebrew..."
if test ! $(which brew)
then
  echo " → Installing Homebrew for package management..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

echo "→ Installing packages using Homebrew..."
brew install $(cat packages/brew|grep -v "#")

echo "→ Installing applications..."
brew cask install $(cat packages/cask|grep -v "#")

echo "→ Installing antigen..."
curl -L git.io/antigen > ~/antigen.zsh

echo "→ Configuring antigen..."
ln -s ~/dotfiles/config/zsh ~/.zshrc

echo "→ Set zsh as default shell..."
chsh -s /bin/zsh

echo "→ Configuring Git..."
ln -s ~/dotfiles/config/gitconfig ~/.gitconfig
ln -s ~/dotfiles/config/gitattributes ~/.gitattributes
ln -s ~/dotfiles/config/gitignore_global ~/.gitignore_global