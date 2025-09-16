{pkgs, ...}: {
  home.packages = with pkgs; [
    act
    actionlint
  ];

  programs.gh = {
    enable = true;
  };
}
