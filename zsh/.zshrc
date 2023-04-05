#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
# plug "zap-zsh/vim"
plug "zap-zsh/zap-prompt"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"

autoload -U compinit && compinit

# keybinds
bindkey '^ ' autosuggest-accept
bindkey '^R' history-incremental-search-backward

eval `ssh-agent -s` > /dev/null && ssh-add > /dev/null 2>&1
