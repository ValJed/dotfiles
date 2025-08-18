{...}: {
  programs.git = {
    enable = true;
    userName = "Jed";
    userEmail = "vjeudy@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      merge = {
        tool = "nvimdiff";
      };
    };
  };
}
