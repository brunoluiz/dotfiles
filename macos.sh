#!/bin/bash

# Installs homebrew
if ! command -v brew 2>&1 >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >>$HOME/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Installs all dependencies from Brewfile
brew bundle install
mise install

# Adds fish as default shell
sudo sh -c "echo $(which fish) >> /etc/shells"
chsh -s $(which fish)

# fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'
