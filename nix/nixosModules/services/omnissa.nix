{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    omnissa-horizon-client
  ];
}
