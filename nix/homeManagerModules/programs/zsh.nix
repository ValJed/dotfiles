{ hostname }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    zplug = {
      enable = true;
      plugins = [
       { name = "hlissner/zsh-autopair"; }
       { name = "zsh-users/zsh-syntax-highlighting"; }
       { name = "zsh-users/zsh-completions"; }
       { name = "zsh-users/zsh-autosuggestions"; }
       { name = "Aloxaf/fzf-tab"; }
       { name = "jeffreytse/zsh-vi-mode"; }
      ];
    };
    initExtra = ''
      source ~/.config/zsh/default.zsh
    '';
     shellAliases = {
        nixos-switch = "sudo nixos-rebuild --flake ~/dotfiles/nix#${hostname} switch";
        nixhome-switch = "home-manager --flake ~/dotfiles/nix#jed@${hostname} switch";
        act = "~/apps/assembly-cloud-tools/bin/act";
    };
  };
}
