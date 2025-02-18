{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaPackages = [
      pkgs.luajitPackages.inspect
    ];
  };
}
