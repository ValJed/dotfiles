
#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="alacrity"
export BROWSER="firefox"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/stagecoach/bin:$PATH
export XDG_CURRENT_DESKTOP="i3"
# #export PATH="$PATH:./node_modules/.bin"
# eval "$(fnm env)"
# eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"
