# GitHub Copilot Instructions for dotfiles

This document provides instructions for GitHub Copilot when working with this dotfiles repository. It helps Copilot understand the purpose, structure, and conventions of this repository to provide more accurate and relevant suggestions.

## Repository Overview

This is a personal dotfiles repository that manages development environment configurations across multiple machines. It includes configuration for:

- Shell environment (zsh)
- Development tools and languages via mise (previously rtx/asdf)
- Package managers (Homebrew, npm, pip/uv/pipx)
- Code editors (VS Code, Cursor)
- Terminal configurations (starship, tmux)
- Git settings and aliases
- AWS and cloud tools

## Repository Structure

- `/brewfiles/` - Homebrew bundle files
  - `/cli/` - Command-line tools and utilities
  - `/gui/` - GUI applications
- `/git/` - Git configuration files
- `/mise/` - Tool version manager configuration
- `/vscode/` - VS Code/Cursor settings and extensions
  - `/snippets/` - Code snippets for VS Code/Cursor
- `/zsh/` - Zsh shell configuration
- `.github/` - GitHub-specific files including prompts for Copilot
- Root scripts - Installation and update scripts

## Intended Workflow

1. Initial setup: `./install.sh` sets up a new machine with essential tools
2. Updates: `./update.sh` syncs configuration across machines
3. Extension management: `./dump-vscode-extensions.sh` keeps VS Code extensions in sync
4. Task management: Uses Task CLI (Taskfile.yml) for common operations

## Conventions and Preferences

### Programming Languages

- **Go**: Using golangci-lint, goimports, and automatic testing on save
- **JavaScript/TypeScript**: Using Biome for formatting and linting
- **Python**: Using ruff for linting and formatting, pytest for testing
- **Terraform/Infrastructure**: Various AWS, Azure, GCP tools and Terraform ecosystem

### Code Style

- Consistent formatting with formatters for each language
- Pre-commit hooks for ensuring code quality
- Automatic formatting on save

### Editor Settings

- Use VS Code or Cursor as the primary code editor
- Dark theme preference
- Strong preference for formatters and linters
- Copilot is configured and used extensively

### Terminal Experience

- Zsh with starship prompt
- mcfly for history management
- zoxide for navigation
- fzf for fuzzy finding

## Key Tools

- **mise**: Version manager for multiple languages and tools
- **Task**: Task runner for this repository
- **Homebrew**: Package manager for macOS
- **GitHub CLI**: Command-line interface for GitHub with Copilot extensions
- **VS Code/Cursor**: Primary code editors

## When Making Suggestions

- Prefer tools already in the toolchain (in mise/glocal-config.toml or Brewfiles)
- Consider cross-platform compatibility (primarily macOS)
- Align with existing code style and formatting preferences
- Leverage automation and scripts where possible
- Recommend modern tools and best practices for development environments
- Consider security and performance implications
