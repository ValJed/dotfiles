{
  pkgs,
  lib,
  ...
}: let
  task = import ../scripts/task.nix {
    inherit pkgs;
    inherit lib;
  };
  tomato = import ../scripts/tomato.nix {
    inherit pkgs;
    inherit lib;
  };
in {
  imports = [
    ../programs/bat.nix
    ../programs/btop.nix
    ../programs/fzf.nix
    ../programs/git.nix
    ../programs/nvim.nix
    ../programs/opencode.nix
    ../programs/pass.nix
    ../programs/starship.nix
    ../programs/tmux.nix
    ../programs/yazi.nix
    ../programs/zsh.nix
  ];

  home.packages = [
    pkgs.bc
    pkgs.dysk
    pkgs.eza
    pkgs.fastfetch
    pkgs.fd
    pkgs.jless
    pkgs.lazydocker
    pkgs.lazygit
    pkgs.presenterm
    pkgs.ripgrep
    pkgs.slumber
    pkgs.tealdeer
    pkgs.tokei
    pkgs.zoxide
    task
    tomato
  ];
}
