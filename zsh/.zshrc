eval "$(mise activate zsh)"
eval "$(starship init zsh)"

export PATH=$PATH:~/.bin

if command -v gh >/dev/null 2>&1 && gh extension list | grep -q 'gh-copilot'; then
  eval "$(gh copilot alias zsh)"
else
  echo "gh or gh-copilot is not installed. Skipping copilot alias."
fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"

# for zsh-completions
chmod go-w $(brew --prefix)/share
chmod -R go-w $(brew --prefix)/share/zsh

# completions
fpath+=~/.zfunc
fpath+=$(brew --prefix)/share/zsh-completions
autoload bashcompinit && bashcompinit # TODO: autoload -U +X bashcompinitのようなオプションがあるので調査
autoload -Uz compinit && compinit
complete -C aws_completer aws
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(awsume-autocomplete)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume
complete -o nospace -C terraform terraform
complete -o nospace -C terragrunt terragrunt

function fzf-ghq () {
  local selected_dir=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi
  zle -R -c
}
zle -N fzf-ghq
bindkey '^]' fzf-ghq

zle -N zi
bindkey '^z' zi

function history-all { history -E 1 }

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

alias awsume="source awsume"
alias awsume-list="awsume -l"
alias code="code-insiders"
alias g="git"
alias gs="git status"
alias gc="git commit"
alias gco="git checkout"
alias gp="git push"
alias gps="git push"
alias gpl="git pull"
alias explain-command-tldr="tldr"
alias explain-command-copilot="ghce"
alias suggest-command="ghcs"
alias ghmr="gh models run"
alias get-commit-message="git diff | gh models run gpt-4.1-mini 'echo commit message following Conventional Commits. Never quote message.'"

export PAGER="less -LRc --mouse"
export LESS=" -LRc --mouse"

setopt auto_cd
setopt share_history

eval "$(mcfly init zsh)"
eval "$(uv generate-shell-completion zsh)"

