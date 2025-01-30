{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    keyMode = "vi";
    prefix = "C-w";
    mouse = true;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-show-powerline true
          set -g @dracula-fixed-location "Lyon"
          set -g @dracula-plugins "weather"
          set -g @dracula-show-fahrenheit false
          set -g @dracula-show-flags true
          set -g @dracula-show-left-icon session
        '';
      }
      tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      bind -n C-Left resize-pane -L 2
      bind -n C-Right resize-pane -R 2
      bind -n C-Up resize-pane -U 2
      bind -n C-Down resize-pane -D 2

      # Unbind
      unbind -T prefix \'
      unbind -T prefix (

      # Start windows and panes index at 1, not 0
      set -g base-index 1
      setw -g pane-base-index 1

      # Ensure window index numbers get reordered on delete
      set-option -g renumber-windows on
      # bind-key -T prefix r, command-prompt "rename-window '%%'"
      bind-key          , command-prompt "rename-window '%%'"

      # Windows navigation

      bind-key h previous-window
      bind-key l next-window
      bind-key -T prefix & select-window -t :=1
      bind-key -T prefix é select-window -t :=2
      bind-key -T prefix \" select-window -t :=3
      bind-key -T prefix \' select-window -t :=4
      bind-key -T prefix \( select-window -t :=5
      bind-key -T prefix - select-window -t :=6
      bind-key -T prefix è select-window -t :=7
      bind-key -T prefix _ select-window -t :=8
      bind-key -T prefix ç select-window -t :=9
      bind-key -T prefix à select-window -t :=10

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
