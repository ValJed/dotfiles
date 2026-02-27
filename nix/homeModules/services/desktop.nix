{pkgs, ...}: let
  record = import ../scripts/record.nix {inherit pkgs;};
in {
  imports = [
    ../programs/dunst.nix
    ../programs/firefox.nix
    ../programs/gtk.nix
    ../programs/hyprland.nix
    ../programs/hyprlock.nix
    ../programs/kitty.nix
    ../programs/obsidian.nix
    ../programs/rofi.nix
    ../programs/spotify.nix
    ../programs/swappy.nix
    ../programs/waybar.nix
    ./virt.nix
  ];

  home.packages = [
    record

    # Desktop
    pkgs.dconf-editor
    pkgs.wbg
    pkgs.adwaita-qt
    pkgs.rose-pine-hyprcursor
  ];

  xdg.desktopEntries.obsidian = {
    name = "Obsidian";
    type = "Application";
    exec = "obsidian --disable-gpu %u";
    icon = "obsidian";
  };
}
