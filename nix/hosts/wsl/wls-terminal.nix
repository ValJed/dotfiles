{
  pkgs,
  lib,
  ...
}: let
  task = import ../../homeModules/scripts/task.nix {
    inherit pkgs;
    inherit lib;
  };
  tomato = import ../../homeModules/scripts/tomato.nix {
    inherit pkgs;
    inherit lib;
  };
in {
  imports = [
    ../../homeModules/programs/bat.nix
    ../../homeModules/programs/btop.nix
    ../../homeModules/programs/fzf.nix
    ../../homeModules/programs/nvim.nix
    ../../homeModules/programs/llm.nix
    ../../homeModules/programs/pass.nix
    ../../homeModules/programs/starship.nix
    ../../homeModules/programs/tmux.nix
    ../../homeModules/programs/yazi.nix
    ../../homeModules/programs/zsh.nix

    ./podman.nix
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
    pkgs.git-subrepo

    tomato
    task
  ];
}
