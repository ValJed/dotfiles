#!/bin/sh

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
export JAVA_HOME=/opt/android-studio/jbr
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# zsh-vi-mode 
export ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
export ZVM_KEYTIMEOUT=0.1

# FZF
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p80%,60%'

export PNPM_HOME="/home/jed/.local/share/pnpm"
export OPS_TOOLS="/home/jed/.local/share/ops-tools/bin"
export PATH="$PNPM_HOME:$PATH:$OPS_TOOLS"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
