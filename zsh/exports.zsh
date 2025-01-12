#!/usr/bin/env bash

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="alacrity"
export BROWSER="firefox"
export XDG_CURRENT_DESKTOP="i3"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/opt/stagecoach/bin:$PATH
export PATH=/opt/ops-tools/bin:$PATH

# zsh-vi-mode 
export ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
export ZVM_KEYTIMEOUT=0.1

# FZF
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p80%,60%'

