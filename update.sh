#!/usr/bin/env zsh

set -euo pipefail

mkdir -p ~/.config

# homebrew cli
brew bundle --file=./brewfiles/cli/Brewfile

# mise
mkdir -p ~/.config/mise
ln -sf "$(pwd)/mise/glocal-config.toml" ~/.config/mise/config.toml
mise install
mise up

# homebrew gui
brew bundle --file=./brewfiles/gui/Brewfile

# zsh
ln -sf "$(pwd)/zsh/.zshrc" ~/.

# zsh completions
mkdir -p ~/.zfunc
poetry completions zsh >~/.zfunc/_poetry
gh completion -s zsh >~/.zfunc/_gh
op completion zsh >~/.zfunc/_op
mise completion zsh >~/.zfunc/_mise
aqua completion zsh >~/.zfunc/_aqua
task --completion zsh >~/.zfunc/_task
golangci-lint completion zsh >~/.zfunc/_golangci-lint

# starship
ln -sf "$(pwd)/starship.toml" ~/.config/starship.toml

# git
mkdir -p ~/.config/git
curl -sS https://raw.githubusercontent.com/github/gitignore/main/{Global/macOS.gitignore,} >~/.config/git/ignore
ln -sf "$(pwd)/git/.gitconfig" ~/.gitconfig

# vscode
while read extension; do
	# Skip empty lines and comments
	[[ -z "$extension" || "$extension" =~ ^#.* ]] && continue
	code --install-extension "$extension"
	cursor --install-extension "$extension"
done <"$(pwd)/vscode/common-extensions.txt"

while read extension; do
	# Skip empty lines and comments
	[[ -z "$extension" || "$extension" =~ ^#.* ]] && continue
	code --install-extension "$extension"
done <"$(pwd)/vscode/code-only-extensions.txt"

while read extension; do
	# Skip empty lines and comments
	[[ -z "$extension" || "$extension" =~ ^#.* ]] && continue
	cursor --install-extension "$extension"
done <"$(pwd)/vscode/cursor-only-extensions.txt"

ln -sf "$(pwd)/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "$(pwd)/vscode/settings.json" ~/Library/Application\ Support/Cursor/User/settings.json
ln -sf "$(pwd)/vscode/snippets" ~/Library/Application\ Support/Code/User/snippets
ln -sf "$(pwd)/vscode/snippets" ~/Library/Application\ Support/Cursor/User/snippets

code --update-extensions
cursor --update-extensions

ln -sf "/usr/local/bin/psql" $(which pgcli)
ln -sf "/usr/local/bin/mysql" $(which mycli)

gh extension install github/gh-copilot
gh extension upgrade gh-copilot
gh extension install https://github.com/github/gh-models
gh extension upgrade github/gh-models
