#!/usr/bin/env zsh

set -euo pipefail

tmpdir=$(mktemp -d)
code --list-extensions | sort >"${tmpdir}/code-extensions.txt"
cursor --list-extensions | sort >"${tmpdir}/cursor-extensions.txt"
comm -12 <(cat "${tmpdir}/code-extensions.txt") <(cat "${tmpdir}/cursor-extensions.txt") >vscode/common-extensions.txt
comm -23 <(cat "${tmpdir}/code-extensions.txt") <(cat "${tmpdir}/cursor-extensions.txt") >vscode/code-only-extensions.txt
comm -13 <(cat "${tmpdir}/code-extensions.txt") <(cat "${tmpdir}/cursor-extensions.txt") >vscode/cursor-only-extensions.txt
rm -rf "${tmpdir}"
