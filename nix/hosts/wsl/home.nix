{
  config,
  pkgs,
  lib,
  user,
  ...
}: {
  imports = [
    ./wls-terminal.nix
    ./wls-dev.nix
  ];

  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.javaPackages.compiler.temurin-bin.jre-17
  ];

  home.sessionVariables = {
    JAVA_HOME = "${pkgs.javaPackages.compiler.temurin-bin.jre-17}";
    BROWSER = "";
    EDITOR = "nvim";
    ZSH_TMUX_CONFIG = "$HOME/.config/tmux/tmux.conf";
  };

  home.sessionPath = [
    "${pkgs.javaPackages.compiler.temurin-bin.jre-17}/bin"
  ];

  services.gpg-agent = {
    enable = true;
    pinentry = {
      package = pkgs.pinentry-curses;
    };
  };

  home.file = {
    ".config/tridactyl" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/dotfiles/tridactyl";
      recursive = true;
    };
  };

  programs.zsh = {
    initContent = ''
      if [ -f $HOME/.nix-profile/etc/profile.d/nix-daemon.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix-daemon.sh
      fi

      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' list-colors '$\{s.:. LS_COLORS\}'
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

      # keybinds
      bindkey '^F' autosuggest-accept

      zvm_after_init_commands+=(
        "bindkey '^b' history-search-backward"
        "bindkey '^n' history-search-forward"
        "bindkey '^C' fzf-cd-widget"
        "bindkey '^E' fzf-file-widget"
        "bindkey '^R' fzf-history-widget"
      )

      eval "$(fnm env --use-on-cd --shell zsh)"

      alias -s json=jless
      alias -s js=nvim
      alias -s rs=nvim
      alias -s ts=nvim
      alias -s vue=nvim
      alias -s html=nvim
    '';
    envExtra = ''
      export EDITOR="nvim"
      export SUDO_EDITOR="nvim"
      export TERMINAL="kitty"
      export BROWSER=""
      export PNPM_HOME=$HOME/.pnpm-global
      export ZVM_SYSTEM_CLIPBOARD_ENABLED=true
      export TERM=xterm-256color
      export COLORTERM=truecolor
      export SHELL="zsh"

      export PATH=$HOME/.local/bin:$PATH
      export PATH=$HOME/.cargo/bin:$PATH
      export PATH=$HOME/.npm-global/bin:$PATH
      export PATH=$HOME/.pnpm-global:$PATH
      export PATH=$HOME/.pnpm-global:$PATH
      export PATH="$HOME/.local/share/fnm:$PATH"

      export NODE_OPTIONS="--max-old-space-size=4096"

      # zsh-vi-mode
      export ZVM_KEYTIMEOUT=0.1

      # FZF
      export FZF_TMUX=1
      export FZF_TMUX_OPTS='-p80%,60%'

      source ~/env
    '';
  };

  stylix = {
    enable = true;
    base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
    };
  };

  home.stateVersion = "26.05";
}
