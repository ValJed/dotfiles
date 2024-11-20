#!/usr/bin/env bash

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE
HISTDUP=erase

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/exports.zsh

autoload -U compinit && compinit

setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt auto_cd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# source
source ~/.config/zsh/fzf/key-bindings.zsh
source ~/.config/zsh/fzf/completion.zsh

paste_from_clipboard() {
  # zle self-insert
  # zle -U "$(wl-paste)"
  LBUFFER+="$(wl-paste)"
}

zle -N paste_from_clipboard

# keybinds
bindkey '^ ' autosuggest-accept

zvm_after_init_commands+=(
  "bindkey '^b' history-search-backward" 
  "bindkey '^n' history-search-forward"
  "bindkey '^E' fzf-cd-widget"
  "bindkey '^R' fzf-history-widget"
  "bindkey "^P" paste_from_clipboard"
)

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

