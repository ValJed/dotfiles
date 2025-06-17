{pkgs, ...}: {
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.browserpass pkgs.tridactyl-native];

    # profiles = {
    #   default = {
    #     id = "default";
    #     isDefault = true;
    #     # extensions = [
    #     #   # Enable the browserpass extension
    #     #   pkgs.firefox-addons.browserpass
    #     # ];
    #
    #     search = {
    #       force = true;
    #       default = "DuckDuckGo";
    #       order = [
    #         "DuckDuckGo"
    #         "Google"
    #         "Bing"
    #         "Qwant"
    #         "Wikipedia (en)"
    #         "YouTube"
    #         "History"
    #         "Bookmarks"
    #       ];
    #     };
    #   };
    # };
  };
}
