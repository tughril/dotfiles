#!/usr/bin/env zsh

set -euo pipefail

# install mise
curl https://mise.run | sh

# install homebrew
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

zsh -c update.sh

aqua init
