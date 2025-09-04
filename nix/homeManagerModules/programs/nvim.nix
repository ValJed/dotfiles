{...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaPackages = luajitPackages: [
      luajitPackages.inspect
    ];
  };

  stylix.targets.neovim.enable = false;
}
