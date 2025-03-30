eval "$(mise activate zsh)"

alias awsume="source awsume"
alias awsume-list="awsume -l"

export PATH=$PATH:~/.bin

if command -v gh >/dev/null 2>&1 && gh extension list | grep -q 'gh-copilot'; then
  eval "$(gh copilot alias zsh)"
else
  echo "gh or gh-copilot is not installed. Skipping copilot alias."
fi

# TODO
#compdef awsume
# _arguments "*: :($(awsume-autocomplete))"

function peco-ghq () {
  local selected_dir=$(ghq list -p | peco --prompt="repositories >" --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ghq
bindkey '^]' peco-ghq
