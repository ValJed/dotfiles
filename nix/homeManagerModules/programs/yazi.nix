{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    plugins = {
      toggle-pane = pkgs.yaziPlugins.toggle-pane;
    };
  };
}
