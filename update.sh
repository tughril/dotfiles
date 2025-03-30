#!/usr/bin/env bash

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
mkdir -p ~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry
gh completion -s zsh > ~/.zfunc/_gh

# starship
ln -sf $(pwd)/starship.toml ~/.config/starship.toml

# git
mkdir -p ~/.config/git
curl -sS https://raw.githubusercontent.com/github/gitignore/main/{\
Global/macOS.gitignore,\
} > ~/.config/git/ignore

# vscode
while read extension; do
  # Skip empty lines and comments
  [[ -z "$extension" || "$extension" =~ ^#.* ]] && continue
  code-insiders --install-extension "$extension"
  cursor --install-extension "$extension"
done < "$(pwd)/vscode/common-extensions.txt"

while read extension; do
  # Skip empty lines and comments
  [[ -z "$extension" || "$extension" =~ ^#.* ]] && continue
  code-insiders --install-extension "$extension"
done < "$(pwd)/vscode/code-insiders-only-extensions.txt"

while read extension; do
  # Skip empty lines and comments
  [[ -z "$extension" || "$extension" =~ ^#.* ]] && continue
  cursor --install-extension "$extension"
done < "$(pwd)/vscode/cursor-only-extensions.txt"
