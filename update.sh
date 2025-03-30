#/!/usr/bin/env bash

set -euo pipefail

mkdir -p ~/.config

# mise
mkdir -p ~/.config/mise
ln -sf $(pwd)/mise/glocal-config.toml ~/.config/mise/config.toml
mise install

# homebrew
brew bundle

# zsh
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc

# starship
ln -sf $(pwd)/starship.toml ~/.config/starship.toml

