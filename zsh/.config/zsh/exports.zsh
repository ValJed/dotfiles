#!/bin/sh

# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="alacrity"
export BROWSER="firefox"
export XDG_CURRENT_DESKTOP="i3"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/opt/stagecoach/bin:$PATH
export PATH=/opt/ops-tools/bin:$PATH

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export NDK_HOME=/home/jed/Android/Sdk/ndk/26.3.11579264
# export CARGO_HOME=$HOME/.cargo
# export RUSTUP_HOME=$HOME/.rustup
export JAVA_HOME=/opt/android-studio/jbr

# zsh-vi-mode 
export ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
export ZVM_KEYTIMEOUT=0.1

# FZF
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p80%,60%'

export PNPM_HOME="/home/jed/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
