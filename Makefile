format:
	mkdir -p .tmp
	cat vscode/settings.json | jq -S > .tmp/vscode-settings.json
	mv .tmp/vscode-settings.json vscode/settings.json
	rm -rf .tmp
