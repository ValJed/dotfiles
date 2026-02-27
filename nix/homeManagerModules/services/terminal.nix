{
  pkgs,
  lib,
}: let
  task = import ./scripts/task.nix {
    inherit pkgs;
    inherit lib;
  };
  tomato = import ./scripts/tomato.nix {
    inherit pkgs;
    inherit lib;
  };
in {
  imports = [
    ./programs/bat.nix
    ./programs/btop.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/nvim.nix
    ./programs/opencode.nix
    ./programs/pass.nix
    ./programs/starship.nix
    ./programs/tmux.nix
    ./programs/yazi.nix
    ./programs/zsh.nix
    task
    tomato
  ];

  home.packages = [
    # Tools
    pkgs.lazygit
    pkgs.lazydocker
    pkgs.eza
    pkgs.fd
    pkgs.zoxide
    pkgs.starship
    pkgs.ripgrep
    pkgs.jless
    pkgs.tokei
    pkgs.tealdeer
    pkgs.fastfetch
    pkgs.bc
    pkgs.dysk
    pkgs.slumber
    pkgs.presenterm

    # pkgs.nodePackages.eas-cli Removed for now since breaks at build time
  ];
}
