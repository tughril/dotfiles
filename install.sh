
set -euo pipefail

# install homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

bash -c update.sh

mise install
