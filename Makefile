format:
	mkdir -p .tmp
	cat vscode/settings.json | jq -S > .tmp/vscode-settings.json
	mv .tmp/vscode-settings.json vscode/settings.json
	rm -rf .tmp

brew-deps:
	brew deps --installed --tree

brew-deps-formula:
	brew deps --installed --tree --formula

brew-deps-cask:
	brew deps --installed --tree --cask

brew-autoremove:
	brew autoremove
