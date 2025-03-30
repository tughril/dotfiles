#!/usr/bin/env bash

set -euo pipefail

mkdir -p .tmp
code-insiders --list-extensions | sort > .tmp/code-insiders-extensions.txt
cursor --list-extensions | sort > .tmp/cursor-extensions.txt
comm -12 <(cat .tmp/code-insiders-extensions.txt) <(cat .tmp/cursor-extensions.txt) > vscode/common-extensions.txt
comm -23 <(cat .tmp/code-insiders-extensions.txt) <(cat .tmp/cursor-extensions.txt) > vscode/code-insiders-only-extensions.txt
comm -13 <(cat .tmp/code-insiders-extensions.txt) <(cat .tmp/cursor-extensions.txt) > vscode/cursor-only-extensions.txt
rm -rf .tmp
