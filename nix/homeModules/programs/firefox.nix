{
  pkgs,
  user,
  config,
  ...
}: {
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.browserpass
      pkgs.tridactyl-native
    ];
    languagePacks = ["fr-FR" "en-US"];
    # profiles = {
    #   default = {
    #     isDefault = true;
    #     extensions.packages = [
    #       browserpass
    #       duckduckgo-privacy
    #       pocket-tube
    #       tridactyl
    #       ublock-origin
    #       unhook
    #     ];
    #     search = {
    #       force = true;
    #       default = "google";
    #       order = [
    #         "google"
    #         "ddg"
    #         "bingg"
    #         "qwant"
    #         "wikipedia"
    #         "youtube"
    #         "history"
    #         "bookmarks"
    #       ];
    #     };
    #     settings = {
    #       "intl.locale.requested" = "en-US";
    #       "intl.accept_languages" = "fr-FR, fr";
    #       "browser.translations.automaticallyPopup" = false;
    #     };
    #   };
    # };
  };

  home.file = {
    ".config/tridactyl" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/dotfiles/tridactyl";
      recursive = true;
    };
  };

  stylix.targets.firefox = {
    enable = false;
    profileNames = ["default"];
  };
}
# ublock-origin = pkgs.fetchFirefoxAddon {
#   name = "ublock-origin";
#   url = "https://addons.mozilla.org/firefox/downloads/file/4814095/ublock_origin-1.71.0.xpi";
#   sha256 = "sha256-R/eIofwsAUgwswuw75WIYVcBuYxSZfsZuM9Lp3mEn+s=";
# };
# browserpass = pkgs.fetchFirefoxAddon {
#   name = "browserpass";
#   url = "https://addons.mozilla.org/firefox/downloads/file/4542488/browserpass_ce-3.11.0.xpi";
#   sha256 = "sha256-Eaz/09v+C+STx4VWad0k+vMl3aii7g7mcUiWlQD113g=";
# };
# pocket-tube = pkgs.fetchFirefoxAddon {
#   name = "pocket-tube";
#   url = "https://addons.mozilla.org/firefox/downloads/file/4824934/youtube_subscription_groups-18.5.17.xpi";
#   sha256 = "sha256-QYrTagvaqRSmT7KF1CUNmiI2fl7ngrssUXVdPVhWwDM=";
# };
# unhook = pkgs.fetchFirefoxAddon {
#   name = "unhook";
#   url = "https://addons.mozilla.org/firefox/downloads/file/4733035/youtube_recommended_videos-1.6.9.xpi";
#   sha256 = "sha256-Rrv0C3gazjI3cf8ZPF3ieFtBDV2INkH48Hw5Oo+W1pw=";
# };
# tridactyl = pkgs.fetchFirefoxAddon {
#   name = "tridactyl";
#   url = "https://addons.mozilla.org/firefox/downloads/file/4549492/tridactyl_vim-1.24.4.xpi";
#   sha256 = "sha256-m6fWvDvlVWMcmBw6zdJcq2lCwfSm8MtRG76PqB153Z0=";
# };
# duckduckgo-privacy = pkgs.fetchFirefoxAddon {
#   name = "duckduckgo-privacy";
#   url = "https://addons.mozilla.org/firefox/downloads/file/4785961/duckduckgo_for_firefox-2026.4.28.xpi";
#   sha256 = "sha256-JFE1AOX40h4T4xJ071X4C4lx1PAkS/ehlW5mOSiUuX8=";
# };

