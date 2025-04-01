#!/usr/bin/env bash

set -euo pipefail

tmpdir=$(mktemp -d)
code-insiders --list-extensions | sort >"${tmpdir}/code-insiders-extensions.txt"
cursor --list-extensions | sort >"${tmpdir}/cursor-extensions.txt"
comm -12 <(cat "${tmpdir}/code-insiders-extensions.txt") <(cat "${tmpdir}/cursor-extensions.txt") >vscode/common-extensions.txt
comm -23 <(cat "${tmpdir}/code-insiders-extensions.txt") <(cat "${tmpdir}/cursor-extensions.txt") >vscode/code-insiders-only-extensions.txt
comm -13 <(cat "${tmpdir}/code-insiders-extensions.txt") <(cat "${tmpdir}/cursor-extensions.txt") >vscode/cursor-only-extensions.txt
rm -rf "${tmpdir}"
