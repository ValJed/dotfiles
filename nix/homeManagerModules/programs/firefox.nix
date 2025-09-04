{pkgs, ...}: {
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.browserpass
      pkgs.tridactyl-native
    ];

    profiles = {
      default = {
        isDefault = true;
        search = {
          force = true;
          default = "google";
          order = [
            "google"
            "ddg"
            "bingg"
            "qwant"
            "wikipedia"
            "youtube"
            "history"
            "bookmarks"
          ];
        };
      };
    };
  };

  stylix.targets.firefox = {
    enable = true;
    profileNames = ["default"];
  };
}
