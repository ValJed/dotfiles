{pkgs, ...}: {
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.browserpass];
  };
}
