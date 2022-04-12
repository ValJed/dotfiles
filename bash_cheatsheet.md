# Bash Cheet Sheet

```bash
# Adds terminal alternative (path to bin should be good)
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50

# Choose default terminal
sudo update-alternatives --config x-terminal-emulator

# Make terminal launched with specific process
chsh -s `which fish` # We get the binary from which command

# Rebuild fonts cache (put fonts in ~/.fonts/..)
fc-cache -fv

# List available fonts
fc-list

# Stow config
stow alacritty
stow i3
stow polybar
stow rofi

# Because there are generated config that we don't want to touch
stow fish --no-folding
```