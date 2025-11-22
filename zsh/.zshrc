export EDITOR="nvim"
export TERMINAL="alacritty"

# pyenv init config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
eval "$(pyenv init -)"

# nvm path
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_
CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Enable colors and change prompt:
autoload -U colors && colors
autoload -Uz add-zsh-hook

# for recent files
DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
	[[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='20'

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
_comp_options+=(globdots)

# aliases
alias src="source $HOME/.zshrc"
alias ls="ls -m --color=auto"
alias cat="bat"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias dotn="code $HOME/.dotfiles"
alias turing-backend="cd $HOME/dev/MrTuring/backend-js/ && code ."
alias myhistory="history"
alias postman="~/Downloads/Postman/Postman"
alias spdcli="speedtest-cli"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# start theme
eval "$(starship init zsh)"

. "$HOME/.local/bin/env"

bindkey '^l' autosuggest-accept