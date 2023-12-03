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
plug "zap-zsh/zap-prompt"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "jeffreytse/zsh-vi-mode"

autoload -U compinit && compinit

# keybinds
bindkey -M viins 'kj' vi-cmd-mode 
bindkey '^ ' autosuggest-accept
bindkey '^E' fzf-cd-widget


eval `ssh-agent -s` > /dev/null && ssh-add > /dev/null 2>&1

# bun completions
[ -s "/home/jed/.bun/_bun" ] && source "/home/jed/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
