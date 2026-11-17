{pkgs, ...}: {
  programs.k9s = {
    enable = true;
  };
  home.packages = [
    pkgs.kubectl
  ];
}
