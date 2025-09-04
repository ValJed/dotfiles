#!/usr/bin/env bash

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export PNPM_HOME=$HOME/.pnpm-global

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.pnpm-global:$PATH
export PATH=/opt/stagecoach/bin:$PATH
export PATH=/opt/ops-tools/bin:$PATH

# zsh-vi-mode 
export ZVM_KEYTIMEOUT=0.1

# FZF
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p80%,60%'
# export _ZO_FZF_EXTRA_OPTS='--tmux'
# export _ZO_FZF_OPTS=" ${FZF_DEFAULT_OPTS} --tmux"

