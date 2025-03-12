#!/usr/bin/env bash

# Basics
alias aliases='print -rl -- ${(k)aliases}'
alias grep='grep --color=auto'
alias run="npm run"
alias s="sudo "
alias n="nvim"
alias ...="cd ../.."
alias ....="cd ../../.."
alias pn="pnpm"
alias prun="pnpm run"
alias cl="clear"
alias y="yazi"
alias calc="bc -l"
 
# Files system
alias ls='eza --group-directories-first --icons'
if eza --version | grep -q '+git';
then
	alias ll='ls -lh --git'
else
	alias ll='ls -lh'
fi
alias la='ll -a'
alias l='la'
alias tree='ll --tree --level=2'
alias tree1='ll --tree --level=1'
alias tree2='ll --tree --level=2'
alias tree3='ll --tree --level=3'

# Locations
alias doc="cd /home/$USER/Documents/"
alias wp="cd /home/$USER/workspace/"
alias apo="cd /home/$USER/workspace/apo/"
alias pj="cd /home/$USER/workspace/projects/"
alias dl="cd /home/$USER/Downloads/"
alias pic="cd /home/$USER/Pictures/"
alias dtf="cd ~/dotfiles/ && $EDITOR"

# Binaries
alias pm="/home/$USER/Documents/tools/postman/Postman"
alias robo="/home/$USER/Documents/tools/robo3t/bin/robo3t"
alias tor="/home/$USER/Documents/tools/tor && ./start-tor-browser.desktop"
alias dc="docker-compose"
alias patator="/home/$USER/Documents/tools/hacking/patator/patator.py"
alias np="/opt/ops-tools/bin/np"
alias monero="/home/val/Documents/monero/monero-wallet-gui"

# Tmux
alias tmm="tmux attach -t main || tmux new -s main"
alias tmc="tmux attach -t code || tmux new -s code"
alias tmk="tmux kill-session -t "
alias tms="tmux source-file ~/.tmux.conf"

# Commands
alias proc="ps aux --sort=-%mem | awk 'NR<=10{print $0}"
alias cw="cargo watch -c -q -x"
alias cwr="cargo watch -c -q -x \"run -q\""
alias cwb="cargo watch -c -q -x \"build -q\""
alias cww="cargo watch -i .gitignore -i \"pkg/*\" -s \"wasm-pack build --target web\""
alias sn="sudo -e"
alias clip="xclip -selection clipboard"

# Tasks
alias tkls="task ls"
alias tklsa="task lsa"
alias tklsc="task lsc"
alias tku="task use"
alias tka="task add"
alias tkd="task done"
alias tkrm="task rm"
alias tkrmc="task rmc"
alias tkc="task clear"

# Rest
alias GET="lwp-request -m \"GET\""
alias DELETE="lwp-request -m \"DELETE\""
alias POST="lwp-request -m \"POST\""
alias PUT="lwp-request -m \"PUT\""
alias PATCH="lwp-request -m \"PATCH\""
alias HEAD="lwp-request -m \"HEAD\""

# GIT commands
alias gl="git pull"
alias glf="git pull --force"
alias glr="git pull --rebase"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpf!="git push --force"
alias gpd="git push origin --delete"
alias glg="git log"
alias glgl="git log --oneline"
alias gco="git checkout"
alias gm="git merge"
alias gcl="git clone"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gdca="git diff --cached"
alias gdt="git diff-tree --no-commit-id --name-only -r"
alias gst="git status"
alias gs="git stash"
alias gsp="git stash pop"
alias gr="git reset"
alias grh="git reset --hard"
alias grb="git rebase"
alias gf="git fetch"
alias gfa="git fetch --all"
alias ga="git add"
alias gc="git commit"
alias gcmsg="git commit -m"
alias gb="git branch"
alias gbd="git branch --delete"
alias gbdm="git branch --merged | grep -v \* | xargs git branch -D"
alias gpristine="git reset --hard && git clean --force -dfx"

# Apostrophe
alias a3u="node app @apostrophecms/user:add"
alias a3g="node app @apostrophecms-pro/advanced-permission-group:add-admin admin"
alias a2u="node app apostrophe-users:add"
alias link="~/dotfiles/scripts/link.sh"
alias cypress_clean="sudo rm -rf ~/.config/Cypress/cy/production/browsers/**"
alias rmnm="rm -rf node_modules package-lock.json && npm i"

