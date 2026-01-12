{
  config,
  pkgs,
  hostname,
  ...
}: {
  home.packages = with pkgs; [
    zsh-fzf-tab
    zsh-vi-mode
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#${config.lib.stylix.colors.base0A}";
    };
    syntaxHighlighting.enable = true;
    history = {
      path = "/home/jed/.zsh_history";
      size = 50000;
      save = 50000;
      append = true;
      share = true;
      ignoreSpace = true;
      ignoreAllDups = true;
      findNoDups = true;
      saveNoDups = true;
    };
    completionInit = ''
      fpath+=($HOME/.local/share/zsh/completions $HOME/.local/share/zsh/vendor-completions)
      autoload -U compinit && compinit

      # Sourcing plugins
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    initContent = ''
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

      type starship_zle-keymap-select >/dev/null || \
        {
          eval "$(starship init zsh)"
        }
      eval "$(zoxide init --cmd cd zsh)"

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
      export BROWSER="firefox"
      export PNPM_HOME=$HOME/.pnpm-global
      export ZVM_SYSTEM_CLIPBOARD_ENABLED=true

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
    '';
    shellAliases = {
      nixos-switch = "sudo nixos-rebuild --flake ~/dotfiles/nix#${hostname} switch";

      # Basics
      aliases = "print -rl -- $\{(k)aliases\}";
      grep = "grep --color=auto";
      run = "npm run";
      s = "sudo ";
      n = "nvim";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      pn = "pnpm";
      prun = "pnpm run";
      cl = "clear";
      y = "yazi";
      calc = "bc -l";
      sn = "sudo -e";

      # Files system
      ls = "eza --group-directories-first --icons";
      ll = "ls -lh --git";
      la = "ll -a";
      l = "la";
      tree = "ll --tree --level=2";
      tree1 = "ll --tree --level=1";
      tree2 = "ll --tree --level=2";
      tree3 = "ll --tree --level=3";

      # Locations
      doc = "cd $HOME/Documents/";
      wp = "cd $HOME/workspace/";
      apo = "cd $HOME/workspace/apo/";
      pj = "cd $HOME/workspace/projects/";
      dl = "cd $HOME/Downloads/";
      pic = "cd $HOME/Pictures/";
      dtf = "cd ~/dotfiles/ && $EDITOR";

      # Binaries
      pm = "$HOME/Documents/tools/postman/Postman";
      robo = "$HOME/Documents/tools/robo3t/bin/robo3t";
      tor = "$HOME/Documents/tools/tor && ./start-tor-browser.desktop";
      dc = "docker-compose";
      patator = "$HOME/Documents/tools/hacking/patator/patator.py";
      np = "~/apps/ops-tools/bin/np";
      monero = "/home/val/Documents/monero/monero-wallet-gui";

      # Tmux
      tmm = "tmux attach -t main || tmux new -s main";
      tmc = "tmux attach -t code || tmux new -s code";
      tmk = "tmux kill-session -t ";
      tms = "tmux source-file ~/.tmux.conf";

      # Cargo
      cw = "cargo watch -c -q -x";
      cwr = "cargo watch -c -q -x \"run -q\"";
      cwb = "cargo watch -c -q -x \"build -q\"";
      cww = "cargo watch -i .gitignore -i \"pkg/*\" -s \"wasm-pack build --target web\"";

      # Tasks
      tkls = "task ls";
      tklsa = "task lsa";
      tklsc = "task lsc";
      tku = "task use";
      tka = "task add";
      tkd = "task done";
      tkrm = "task rm";
      tkrmc = "task rmc";
      tkc = "task clear";

      # GIT commands
      gl = "git pull";
      glf = "git pull --force";
      glr = "git pull --rebase";
      gp = "git push";
      gpf = "git push --force-with-lease";
      gpd = "git push origin --delete";
      glg = "git log";
      glgl = "git log --oneline";
      gco = "git checkout";
      gm = "git merge";
      gcl = "git clone";
      gcp = "git cherry-pick";
      gd = "git diff";
      gdca = "git diff --cached";
      gdt = "git diff-tree --no-commit-id --name-only -r";
      gst = "git status";
      gs = "git stash";
      gsp = "git stash pop";
      gr = "git reset";
      grh = "git reset --hard";
      grb = "git rebase";
      gf = "git fetch";
      gfa = "git fetch --all";
      ga = "git add";
      gc = "git commit";
      gcmsg = "git commit -m";
      gb = "git branch";
      gbd = "git branch --delete";
      gbdm = "git branch --merged | grep -v \* | xargs git branch -D";
      gpristine = "git reset --hard && git clean --force -dfx";

      # Apostrophe
      ac = "~/apps/assembly-cloud-tools/bin/act";
      a3u = "node app @apostrophecms/user:add";
      a3g = "node app @apostrophecms-pro/advanced-permission-group:add-admin admin";
      a2u = "node app apostrophe-users:add";
      link = "~/dotfiles/scripts/link.sh";
      encode_subtitles = "~/dotfiles/scripts/encode_subtitles.sh";
      cypress_clean = "sudo rm -rf ~/.config/Cypress/cy/production/browsers/**";
      rmnm = "rm -rf node_modules package-lock.json && npm i";
    };
  };
}
# export _ZO_FZF_EXTRA_OPTS='--tmux'
# export _ZO_FZF_OPTS=" ${FZF_DEFAULT_OPTS} --tmux"

