{
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
    ../../homeModules/programs/bat.nix
    ../../homeModules/programs/btop.nix
    ../../homeModules/programs/fzf.nix
    ../../homeModules/programs/nvim.nix
    ../../homeModules/programs/opencode.nix
    ../../homeModules/programs/pass.nix
    ../../homeModules/programs/starship.nix
    ../../homeModules/programs/tmux.nix
    ../../homeModules/programs/yazi.nix
    ../../homeModules/programs/zsh.nix
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
  ];
}
