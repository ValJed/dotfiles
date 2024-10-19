{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.dracula;
        extraConfig ''
          set -g @dracula-show-powerline true
          set -g @dracula-fixed-location "Lyon"
          set -g @dracula-plugins "weather"
          set -g @dracula-show-fahrenheit false
          set -g @dracula-show-flags true
          set -g @dracula-show-left-icon session 
        ''
      }
      tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      set-option -g default-shell /usr/bin/zsh
      set-option -g prefix C-w

      unbind-key C-b
      bind C-w send-prefix

      # act like vim
      setw -g mode-keys vi

      bind -n C-Left resize-pane -L 2
      bind -n C-Right resize-pane -R 2
      bind -n C-Up resize-pane -U 2
      bind -n C-Down resize-pane -D 2

      # Mouse mode
      setw -g mouse on

      bind-key h previous-window
      bind-key l next-window

      # Copy mode
      unbind [

      bind u copy-mode 
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi r send -X rectangle-toggle
      bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'wl-copy'

      # open split in current directory
      bind c new-window -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind b split-window -v -c "#{pane_current_path}"

      # Re bind kill pane and window to avoid confirmation
      # bind-key & kill-window
      bind x kill-pane

      # Disable escape timeout
      set -sg escape-time 0
      setw -g automatic-rename-format "#{b:pane_current_path}"
    '';
  };
}
