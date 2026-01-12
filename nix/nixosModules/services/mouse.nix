{pkgs, ...}: {
  hardware.openrazer = {
    enable = true;
    users = ["jed"];
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  users.users.jed.extraGroups = ["input"];
}
