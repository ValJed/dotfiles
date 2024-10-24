{ config, lib, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    zplug = {
      enable = true;
      plugins = [
       { name = "hlissner/zsh-autopair"; }
       { name = "zsh-users/zsh-syntax-highlighting"; }
       { name = "zsh-users/zsh-completions"; }
       { name = "zsh-users/zsh-autosuggestions"; }
       { name = "Aloxaf/fzf-tab"; }
       { name = "jeffreytse/zsh-vi-mode"; }
      ]
    }
  };
}
