#!/usr/bin/env zsh

set -euo pipefail

# install mise
curl https://mise.run | sh

# install homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

bash -c update.sh

aqua init
