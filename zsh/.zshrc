#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# plugins
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "jeffreytse/zsh-vi-mode"
plug "Aloxaf/fzf-tab"

autoload -U compinit && compinit

# history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE
HISTDUP=erase
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

# keybinds
bindkey '^b' history-search-backward
bindkey '^n' history-search-forward
bindkey '^ ' autosuggest-accept

bindkey '^E' fzf-cd-widget
bindkey -M vicmd '^E' fzf-cd-widget
bindkey -M viins '^E' fzf-cd-widget 

# bun completions
[ -s "/home/jed/.bun/_bun" ] && source "/home/jed/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# source
source ~/.local/share/fzf/key-bindings.zsh
source ~/.local/share/fzf/completion.zsh

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
