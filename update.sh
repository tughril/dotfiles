#/!/usr/bin/env bash

set -euo pipefail

# homebrew
brew bundle

# mise
mkdir -p ~/.config/mise
ln -sf $(pwd)/mise/glocal-config.toml ~/.config/mise/config.toml
mise install
