#!/bin/sh

# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="alacrity"
export BROWSER="firefox"
export XDG_CURRENT_DESKTOP="i3"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/stagecoach/bin:$PATH
export PATH="/opt/ops-tools/bin:$PATH"

export PNPM_HOME="/home/jed/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
