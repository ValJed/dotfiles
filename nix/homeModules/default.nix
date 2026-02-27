{
  hasDesktop,
  lib,
  ...
}: {
  imports =
    [
      ./services/terminal.nix
      ./services/dev.nix
    ]
    ++ lib.optionals hasDesktop [
      ./services/desktop.nix
    ];

  home.username = "jed";
  home.homeDirectory = "/home/jed";

  home.sessionVariables = {
    EDITOR = "nvim";
    ZSH_TMUX_CONFIG = "$HOME/.config/tmux/tmux.conf";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
