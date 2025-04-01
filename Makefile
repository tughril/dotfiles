.PHONY: all clean test

.PHONY: setup
setup:
	pre-commit install

.PHONY: format
format: sort-vscode-settings format-prettier format-sh format-toml

.PHONY: sort-vscode-settings
format-vscode-settings:
	$(eval TMP := $(shell mktemp -d))
	cat vscode/settings.json | jq -S > $(TMP)/vscode-settings.json
	mv $(TMP)/vscode-settings.json vscode/settings.json
	rm -rf $(TMP)

.PHONY: format-prettier
format-prettier:
	prettier --write .

.PHONY: format-sh
format-sh:
	$(eval SHELL_SCRIPTS := $(shell find . -name "*.sh"))
	shfmt -w $(SHELL_SCRIPTS)

.PHONY: format-toml
format-toml:
	$(eval TOML_FILES := $(shell find . -name "*.toml"))
	taplo format $(TOML_FILES)

.PHONY: brew-deps
brew-deps:
	brew deps --installed --tree

.PHONY: brew-deps-formula
brew-deps-formula:
	brew deps --installed --tree --formula

.PHONY: brew-autoremove
brew-autoremove:
	brew autoremove

.PHONY: list-mise
list-mise:
	mise list

.PHONY: lint
lint: lint-sh shellcheck

.PHONY: lint-sh
lint-sh:
	$(eval SHELL_SCRIPTS := $(shell find . -name "*.sh"))
	shellcheck $(SHELL_SCRIPTS)

.PHONY: lint-makefile
lint-makefile:
	checkmake Makefile
