{...}: {
  programs.git = {
    userName = "Jed";
    userEmail = "vjeudy@protonmail.com";
    extraConfig = {
      merge = {
        tool = "nvimdiff";
      };
    };
  };
}
